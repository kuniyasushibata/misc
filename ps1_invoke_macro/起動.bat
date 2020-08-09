@echo off
setlocal

Powershell -file "%~dp0invoke_macro.ps1"

endlocal
exit /B


:ERROR
endlocal
pause
exit /B
