$ErrorActionPreference = "Stop"

$root = (Resolve-Path ".").Path

function Get-RelativeVaultPath {
  param(
    [Parameter(Mandatory = $true)][string]$BasePath,
    [Parameter(Mandatory = $true)][string]$TargetPath
  )

  $baseFull = [System.IO.Path]::GetFullPath($BasePath).Replace("\", "/").TrimEnd("/")
  $targetFull = [System.IO.Path]::GetFullPath($TargetPath).Replace("\", "/")
  $prefix = "$baseFull/"

  if ($targetFull.StartsWith($prefix, [System.StringComparison]::OrdinalIgnoreCase)) {
    return $targetFull.Substring($prefix.Length)
  }

  if ($targetFull -eq $baseFull) {
    return ""
  }

  throw "Target path is not inside vault root: $TargetPath"
}

function ConvertTo-VaultKey {
  param(
    [Parameter(Mandatory = $true)][string]$Value
  )

  return $Value.Normalize([System.Text.NormalizationForm]::FormC).ToLowerInvariant()
}

$failures = New-Object System.Collections.Generic.List[string]

$allFiles = Get-ChildItem -LiteralPath $root -Recurse -File -Force |
  Where-Object { $_.FullName -notmatch "[\\/]\\.git[\\/]" }

$filesByRelative = @{}
$filesByName = @{}
$markdownByStem = @{}

foreach ($file in $allFiles) {
  $relative = Get-RelativeVaultPath -BasePath $root -TargetPath $file.FullName
  $relativeKey = ConvertTo-VaultKey -Value $relative
  $fileNameKey = ConvertTo-VaultKey -Value $file.Name
  $filesByRelative[$relativeKey] = $true
  $filesByName[$fileNameKey] = $true

  if ($file.Extension -ieq ".md") {
    $stem = ConvertTo-VaultKey -Value ([System.IO.Path]::GetFileNameWithoutExtension($file.Name))
    if (-not $markdownByStem.ContainsKey($stem)) {
      $markdownByStem[$stem] = New-Object System.Collections.Generic.List[string]
    }
    $markdownByStem[$stem].Add($relative)
  }
}

$wikiPattern = "(!)?\[\[([^\]]+)\]\]"
$markdownFiles = $allFiles | Where-Object {
  $_.Extension -ieq ".md" -and
  $_.FullName -notmatch "[\\/]0 - templates[\\/]" -and
  $_.Name -notin @("GUIDELINES.md", "markdown_cheatsheet.md")
}

foreach ($file in $markdownFiles) {
  $relativeFile = Get-RelativeVaultPath -BasePath $root -TargetPath $file.FullName
  $content = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
  if ($null -eq $content) {
    $content = ""
  }
  $matches = [regex]::Matches($content, $wikiPattern)

  foreach ($match in $matches) {
    $target = $match.Groups[2].Value
    $target = ($target -split "\|", 2)[0]
    $target = ($target -split "#", 2)[0].Trim()

    if ([string]::IsNullOrWhiteSpace($target)) {
      continue
    }

    $target = $target.Replace("\", "/")
    $hasExtension = [System.IO.Path]::GetExtension($target)

    if ($hasExtension) {
      $normalized = ConvertTo-VaultKey -Value $target.TrimStart("/")
      $fileName = ConvertTo-VaultKey -Value ([System.IO.Path]::GetFileName($target))
      if (-not $filesByRelative.ContainsKey($normalized) -and -not $filesByName.ContainsKey($fileName)) {
        $failures.Add("$relativeFile links to missing file '$target'")
      }
    } else {
      $stem = ConvertTo-VaultKey -Value ([System.IO.Path]::GetFileNameWithoutExtension($target))
      if (-not $markdownByStem.ContainsKey($stem)) {
        $failures.Add("$relativeFile links to missing note '$target'")
      }
    }
  }
}

if ($failures.Count -gt 0) {
  Write-Host "Vault validation failed:"
  foreach ($failure in $failures) {
    Write-Host "- $failure"
  }
  exit 1
}

Write-Host "Vault validation passed."
