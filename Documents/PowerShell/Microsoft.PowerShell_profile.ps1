$ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"
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

# NoSleep - Prevents screen going to sleep mode
function nos {
    $wsh = New-Object -ComObject WScript.Shell
    while (1) {
        $wsh.SendKeys('+{F15}')
        Start-Sleep -Seconds 59
    }
}

# Workaround for
# Permission denied (publickey,gssapi-keyex,gssapi-with-mic).
set VAGRANT_PREFER_SYSTEM_BIN=0

# Workaround for 
# https://github.com/hashicorp/vagrant/issues/12998
Function VagrantWrapper()
{
    powershell vagrant $args
}

New-alias vagrant VagrantWrapper
