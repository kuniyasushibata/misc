@echo off

setlocal

rem echo %~dp0

if "%1" == "" (
  echo svn_co or svn_up or svn_upを実行してください。
  goto ERROR
)

set args=co up st
set isExit="1"
for %%a in (%args%) do (
  if "%1" == "%%a" (
    set /a isExit="0"
  )
)

if %isExit% == "1" (
  echo 無効な引数%1です
  goto ERROR
)

set svn_url=http://hogehoge.com/
set filenames=itm CommonParts
set list=_list.txt
for %%a in (%filenames%) do (
  rem echo %%a
  if NOT EXIST "..\%%a" (
    echo ..\%%aフォルダを作成します
    mkdir ..\%%a
  )

  for /f "delims=" %%f in (%~dp0%%a%list%) do (
    rem echo ..\%%a\%%f
    if "%1" == "co" (
      if EXIST "..\%%a\%%f" (
        echo フォルダ..\%%a\%%fがあるためスキップします
      ) else (
        echo svn %1 "%svn_url%%%f" ..\%%aします
      )
    ) else if "%1" == "up" (
      if EXIST "..\%%a\%%f" (
        echo svn %1 "..\%%a\%%f"します
      ) else (
        echo フォルダ..\%%a\%%fがないためスキップします
      )
    ) else if "%1" == "st" (
      if EXIST "..\%%a\%%f" (
        echo svn %1 "..\%%a\%%f"します
      ) else (
        echo フォルダ..\%%a\%%fがないためスキップします
      )
    )
  )
)

endlocal
exit /B

:ERROR
endlocal
pause
exit /B
