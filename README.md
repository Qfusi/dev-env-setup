# Windows 10 Developer Environment Setup

Contains (mostly) everything to setup my preferred developer environment.

> Shamelessly ~~stolen~~ inpired by [Microsoft/windows-dev-box-setup-scripts](https://github.com/Microsoft/windows-dev-box-setup-scripts) and other repositories using [boxstarter](https://boxstarter.org/) to setup their developer environments.

This repository aims to set up a development environment to my liking, using my config files and preferences. Use it if you wish, but likely you'll want to fork it and modify it to fit your needs.

## Installation

Through the magic of [Boxstarter](http://boxstarter.org/) we can simply open PowerShell as an Administrator and execute the following command:

```powershell
START http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/Qfusi/dev-env-setup/main/boxstarter.ps1
```

## How it works

The setup is automated using PowerShell scripts.

Software is installed using either [Chocolatey](https://chocolatey.org/) or [Windows Package Manager](https://docs.microsoft.com/en-us/windows/package-manager/) depending on which package manager repository contains the app or wherever it seems to be actively maintained.

[The script](https://github.com/Qfusi/dev-env-setup/blob/master/boxstarter.ps1) executes in separate steps to make for easy modification:

Firstly git is installed and this repository is cloned to `$USERPROFILE\Documents\dev-env-setup`. It is used to call the sub scripts and retrieve the settings files. Instead of simply copying the config files from the repository to their respective locations symbolic links that point to the config files in this git repository are created. This enables the files to be commited easily when settings are changed. Plus, it's convenient to have all config files in the same place.

The different sub scripts are:

- [Unbloat Windows](https://github.com/Qfusi/dev-env-setup/blob/master/scripts/unbloat-windows.ps1) - Removes pre installed bloatware
- [Configure Windows](https://github.com/Qfusi/dev-env-setup/blob/master/scripts/configure-windows.ps1) - Disables a bunch of windows nonsense and sets some settings
- [Install Apps](https://github.com/Qfusi/dev-env-setup/blob/master/scripts/install-apps.ps1) - Installs [apps/tools/runtimes/sdks and extensions](#apps)
- [Apply Configs](https://github.com/Qfusi/dev-env-setup/blob/master/scripts/apply-configs.ps1) - Applies configs and settings from this repository to the environment

## Apps

- Package Managers
  - [Winget]()
  - [Chocolatey]()
- Browsers
  - [Chrome]()
  - [Firefox]()
- Common tools
  - [7zip]()
  - [Paint.Net]()
  - [ScreenToGif]()
  - [ZoomIt]()
  - [Everything]()
  - [Notepad++]()
  - [GrepWin]()
  - [PowerToys]()
- Dev tools
  - [Git]()
  - [Insomnia]()
  - [Sql Server Management Studio]()
  - [Remote Desktop Connection Manager]()
  - [NVMforWindows]()
  - [Powershell Core]()
    - [Posh-git]()
    - [PSReadLine]()
    - [Terminal-Icons]()
    - [Oh-My-Posh]()
    - [HACK-NF]()
  - [Terminal]()
- IDEs
  - [Visual Studio Code]()
  - [Visual Studio Installer]()
  - [JetBrains Toolbox]()
- Runtimes/Sdks
  - [.NET Runtime#Latest]()
  - [.NET SDK#Latest]()
