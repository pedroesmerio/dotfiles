#Personal Alias
Set-Alias cl clear
Set-Alias la ls
Set-Alias lvim C:\Users\pedro.esmerio\.local\bin\lvim.ps1
Set-Alias lv lvim
Set-Alias lg lazygit

# Autocomplete
# Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -PredictionSource History

$ENV:STARSHIP_CONFIG = "$HOME\.dotfiles\starship.toml"
$ENV:STARSHIP_CACHE = "$HOME\AppData\Local\Temp"
Invoke-Expression (&starship init powershell)
