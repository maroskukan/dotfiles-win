# Dotfiles - Windows

## Usage

Fork this repository and follow the steps below:

Create a new `dotfiles` directory in your home folder and initialize a bare repository.

```powershell
mkdir -p $HOME\dotfiles && git init --bare $HOME\dotfiles
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

Configure the upstream repository, update with your username.

```powershell
config remote add origin git@github.com:maroskukan/dotfiles-winls
```

Pull from origin

```powershell
config pull origin main
```