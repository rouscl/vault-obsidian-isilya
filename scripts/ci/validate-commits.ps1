$ErrorActionPreference = "Stop"

$requiredSections = @("Motivo:", "Cambios:", "Verificacion:", "Riesgos:")
$allowedTypes = @("cronica", "canon", "gestion", "fix")

$eventName = $env:GITHUB_EVENT_NAME

if ($eventName -eq "pull_request") {
  $base = $env:GITHUB_BASE_REF
  git fetch origin $base --depth=100
  $range = "origin/$base..HEAD"
} else {
  $before = $env:GITHUB_EVENT_BEFORE
  if ($before -and $before -notmatch "^0+$") {
    $range = "$before..HEAD"
  } else {
    $range = "HEAD~1..HEAD"
  }
}

$commits = git rev-list --no-merges $range

if (-not $commits) {
  Write-Host "No commits to validate."
  exit 0
}

$failures = New-Object System.Collections.Generic.List[string]

foreach ($commit in $commits) {
  $subject = (git log -1 --format=%s $commit) -join "`n"
  $body = (git log -1 --format=%b $commit) -join "`n"

  $typePattern = "^(" + (($allowedTypes | ForEach-Object { [regex]::Escape($_) }) -join "|") + "): .+"
  if ($subject -notmatch $typePattern) {
    $failures.Add("$commit has invalid subject: '$subject'")
  }

  foreach ($section in $requiredSections) {
    if ($body -notmatch "(?m)^$([regex]::Escape($section))\s*$") {
      $failures.Add("$commit is missing section '$section'")
    }
  }
}

if ($failures.Count -gt 0) {
  Write-Host "Commit trace validation failed:"
  foreach ($failure in $failures) {
    Write-Host "- $failure"
  }
  exit 1
}

Write-Host "Commit trace validation passed."
