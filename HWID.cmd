@echo off
MD "%~dp0Hashes" 2>nul
PowerShell -ExecutionPolicy bypass -File "%~dp0Get-WindowsAutoPilotInfo.ps1" -OutputFile "%~dp0Hashes\%computername%.csv" -Append

echo.
echo Exit Code: %ERRORLEVEL%
pause