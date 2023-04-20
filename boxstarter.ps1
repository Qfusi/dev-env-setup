Disable-UAC
$Boxstarter.AutoLogin=$false

function Install-WinGet() {
    if (Get-Command winget -errorAction SilentlyContinue)
    {
        return
    }

    Write-Information "[winget] Downloading Appx packages"

    Push-Location $env:TEMP

    # https://github.com/microsoft/winget-cli/issues/2230
    if (-not (Test-Path 'Microsoft.DesktopAppInstaller.msixbundle')) {
        Write-Information "`tMicrosoft.DesktopAppInstaller"
        Invoke-WebRequest 'https://aka.ms/getwinget' -OutFile 'Microsoft.DesktopAppInstaller.msixbundle' -UseBasicParsing
    }
    if (-not (Test-Path 'Microsoft.UI.Xaml.zip')) {
        Write-Information "`tMicrosoft.UI.Xaml"
        Invoke-WebRequest 'https://www.nuget.org/api/v2/package/Microsoft.UI.Xaml/2.7.1' -OutFile 'Microsoft.UI.Xaml.zip' -UseBasicParsing
    }
    if (-not (Test-Path 'Microsoft.VCLibs.x64.14.Desktop.appx')) {
        Write-Information "`tMicrosoft.VCLibs.x64.14"
        Invoke-WebRequest 'https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx' -OutFile 'Microsoft.VCLibs.x64.14.Desktop.appx' -UseBasicParsing
    }
    if (-not (Test-Path '.\Microsoft.UI.Xaml\tools\AppX\x64\Release\Microsoft.UI.Xaml.2.7.appx')) { Expand-Archive 'Microsoft.UI.Xaml.zip' }

    Write-Information "[winget] Installing"
    Add-AppxPackage 'Microsoft.DesktopAppInstaller.msixbundle' -DependencyPath '.\Microsoft.UI.Xaml\tools\AppX\x64\Release\Microsoft.UI.Xaml.2.7.appx', '.\Microsoft.VCLibs.x64.14.Desktop.appx'

    Pop-Location
}

Install-WinGet

# Install git & clone repository to access config and script files
choco install -y git --params "/GitOnlyOnPath /NoShellIntegration /WindowsTerminal"
RefreshEnv
New-Item -ItemType Directory -Path C:\Repos > $null
git clone https://github.com/Qfusi/dev-env-setup.git "$env:USERPROFILE\Documents\dev-env-setup"

# Execute setup scripts
. "$env:USERPROFILE\Documents\env-setup\scripts\unbloat-windows.ps1"
. "$env:USERPROFILE\Documents\env-setup\scripts\configure-windows.ps1"
. "$env:USERPROFILE\Documents\env-setup\scripts\install-apps.ps1"
. "$env:USERPROFILE\Documents\env-setup\scripts\apply-configs.ps1"

Enable-UAC