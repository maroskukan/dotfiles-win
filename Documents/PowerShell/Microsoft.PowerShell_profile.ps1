$ENV:STARSHIP_CONFIG = "$HOME\.starship\starship.toml"
$ENV:STARSHIP_DISTRO = "者"
Invoke-Expression (&starship init powershell)

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}
Import-Module -Name Terminal-Icons
Import-Module -Name z


Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

function config()
{
    git.exe --git-dir=$HOME\dotfiles --work-tree=$HOME $args
}

# Workaround for 
# https://github.com/hashicorp/vagrant/issues/12998
Function VagrantWrapper()
{
    powershell vagrant $args
}

New-alias vagrant VagrantWrapper