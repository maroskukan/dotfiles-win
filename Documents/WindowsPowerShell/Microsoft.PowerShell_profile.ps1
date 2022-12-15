$ENV:STARSHIP_CONFIG = "$HOME\.starship\starship.toml"
$ENV:STARSHIP_DISTRO = "PS"
Invoke-Expression (&starship init powershell)

# Workaround for
# Permission denied (publickey,gssapi-keyex,gssapi-with-mic).
$ENV:VAGRANT_PREFER_SYSTEM_BIN=0