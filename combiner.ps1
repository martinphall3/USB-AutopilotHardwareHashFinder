$ScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Get-ChildItem -Path (Join-Path $ScriptRoot "Hashes") -Filter *.csv | Select-Object -ExpandProperty FullName | Import-Csv | Export-Csv -Path (Join-Path $ScriptRoot "combined.csv") -NoTypeInformation -Append

# Source - https://stackoverflow.com/a/43972739