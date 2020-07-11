@echo off
setlocal


rem dateから/を削除
set d=%date:/=%
rem echo %d%

rem 時間をhh:mn:ss形式で取得する、スペースを0で置換する
set time_tmp1=%time: =0%
rem echo %time_tmp1%

rem :を削除
set time_tmp2=%time_tmp1::=%
rem echo %time_tmp2%

rem 先頭から6文字取り出す
set t=%time_tmp2:~0,6%
rem echo %t%

set folder=%d%%t%

echo リリースフォルダ
echo %~dp0%folder%
choice /M を作成しますか?

if %errorlevel% == 2 goto ERROR


endlocal
pause
exit /B

:ERROR
echo 終了します
endlocal
pause
exit /B
