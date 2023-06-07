# Dotfiles - Windows

## Requirements

In order to enjoy full terminal experience I highly recommend to install one of the [Nerd Fonts](https://www.nerdfonts.com/). For Windows 11 I currently use `JetBrainsMono Nerd Font` version `2.3.3`.

The PowerShell profile loads the `Terminal-Icons` and `z` modules. Therefore it is assumed you have those installed before pulling and applying the new configuration.

## Usage

### Configuration

Fork this repository and follow the steps below:

Create a new `dotfiles` directory in your home folder and initialize a bare repository.

```powershell
mkdir -p $HOME\dotfiles; git init --bare $HOME\dotfiles
```

> **Note**: To make your life easier, ensure that the initial branch name is `main` by using `git config --global init.defaultBranch main`. I also recommend to use PowerShell 7 version and above as it supports some additional features like AND and OR operators.

Create a runtime function.

```powershell
function config()
{
    git.exe --git-dir=$HOME\dotfiles --work-tree=$HOME $args
}
```

Optionally hide untracked files.

```powershell
config config --local status.showUntrackedFiles no
```

Configure the upstream repository, update remote path with your username.

```powershell
config remote add origin git@github.com:maroskukan/dotfiles-win
```

> **Note**: In order to add origin accessed through SSH it is assumed that you have completed SSH client configuration.

### Pull

It is time to pull from origin.

```powershell
config pull origin main
```

When performing pull for the first time, you may be presented with an error because there might be local untracked files that could be overwritten by the merge.

For example:

```powershell
From github.com:maroskukan/dotfiles-win
 * branch            main       -> FETCH_HEAD
 * [new branch]      main       -> origin/main
error: The following untracked working tree files would be overwritten by merge:
        AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json
Please move or remove them before you merge.
Aborting
```

This is a safety feature, and I suggest to review and backup any existing files are in conflict and running the `config pull origin main` again.

```powershell
mv $HOME/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json `
   $HOME/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json.backup

config pull origin main
```

### Push

When you updated a local file (e.g. `README.md`), you can sync up your changes using the following workflow.

```powershell
config add README.md
config commit -m "feat: update workflow for change"
config push
```