Import-Module posh-git
Import-Module Terminal-Icons
Import-Module PSReadLine

oh-my-posh init pwsh --config "$env:USERPROFILE\Documents\dev-env-setup\configs\oh-my-posh\star-adjusted.omp.json" | Invoke-Expression

# PSReadLine
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

Enable-PoshTransientPrompt

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Alias
Set-Alias g git
Set-Alias d docker
Set-Alias grep findstr

Set-Location C:\Repos

clear-host