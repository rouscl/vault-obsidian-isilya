$ErrorActionPreference = "Stop"

$root = (Resolve-Path ".").Path
$requiredFiles = @(
  "GUIDELINES.md",
  "GIT-WORKFLOW.md",
  "AGENTS.md"
)

function Get-RelativeVaultPath {
  param(
    [Parameter(Mandatory = $true)][string]$BasePath,
    [Parameter(Mandatory = $true)][string]$TargetPath
  )

  $baseUri = [System.Uri]((Join-Path $BasePath ".") + [System.IO.Path]::DirectorySeparatorChar)
  $targetUri = [System.Uri]$TargetPath
  return [System.Uri]::UnescapeDataString($baseUri.MakeRelativeUri($targetUri).ToString()).Replace("\", "/")
}

$failures = New-Object System.Collections.Generic.List[string]

foreach ($file in $requiredFiles) {
  if (-not (Test-Path -LiteralPath (Join-Path $root $file))) {
    $failures.Add("Missing required file: $file")
  }
}

$allFiles = Get-ChildItem -LiteralPath $root -Recurse -File -Force |
  Where-Object { $_.FullName -notmatch "[\\/]\\.git[\\/]" }

$filesByRelative = @{}
$filesByName = @{}
$markdownByStem = @{}

foreach ($file in $allFiles) {
  $relative = Get-RelativeVaultPath -BasePath $root -TargetPath $file.FullName
  $filesByRelative[$relative.ToLowerInvariant()] = $true
  $filesByName[$file.Name.ToLowerInvariant()] = $true

  if ($file.Extension -ieq ".md") {
    $stem = [System.IO.Path]::GetFileNameWithoutExtension($file.Name).ToLowerInvariant()
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
      $normalized = $target.TrimStart("/").ToLowerInvariant()
      $fileName = [System.IO.Path]::GetFileName($target).ToLowerInvariant()
      if (-not $filesByRelative.ContainsKey($normalized) -and -not $filesByName.ContainsKey($fileName)) {
        $failures.Add("$relativeFile links to missing file '$target'")
      }
    } else {
      $stem = [System.IO.Path]::GetFileNameWithoutExtension($target).ToLowerInvariant()
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
