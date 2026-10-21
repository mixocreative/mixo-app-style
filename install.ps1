# Links this repo into the Claude Code and Codex skill folders, so `git pull` updates all of them.
# Uses directory junctions (no admin rights needed). Re-run safely; existing links are replaced.
$ErrorActionPreference = 'Stop'
$repo = $PSScriptRoot
$targets = @(
  "$HOME\.claude\skills\mixo-app-style",  # Claude Code
  "$HOME\.agents\skills\mixo-app-style",  # Codex / cross-runtime alias
  "$HOME\.codex\skills\mixo-app-style"    # Codex
)
foreach ($t in $targets) {
  New-Item -ItemType Directory -Force (Split-Path $t) | Out-Null
  if (Test-Path $t) {
    $item = Get-Item $t -Force
    if ($item.LinkType) { $item.Delete() }
    else { throw "$t exists and is not a link; move it away first." }
  }
  New-Item -ItemType Junction -Path $t -Target $repo | Out-Null
  Write-Host "linked $t -> $repo"
}
