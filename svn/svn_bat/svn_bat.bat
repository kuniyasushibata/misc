@echo off

setlocal

rem echo %~dp0

if "%1" == "" (
  echo svn_co or svn_up or svn_up�����s���Ă��������B
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
  echo �����Ȉ���%1�ł�
  goto ERROR
)

set svn_url=http://hogehoge.com/
set filenames=itm CommonParts
set list=_list.txt
for %%a in (%filenames%) do (
  rem echo %%a
  if NOT EXIST "..\%%a" (
    echo ..\%%a�t�H���_���쐬���܂�
    mkdir ..\%%a
  )

  for /f "delims=" %%f in (%~dp0%%a%list%) do (
    rem echo ..\%%a\%%f
    if "%1" == "co" (
      if EXIST "..\%%a\%%f" (
        echo �t�H���_..\%%a\%%f�����邽�߃X�L�b�v���܂�
      ) else (
        echo svn %1 "%svn_url%%%f" ..\%%a���܂�
      )
    ) else if "%1" == "up" (
      if EXIST "..\%%a\%%f" (
        echo svn %1 "..\%%a\%%f"���܂�
      ) else (
        echo �t�H���_..\%%a\%%f���Ȃ����߃X�L�b�v���܂�
      )
    ) else if "%1" == "st" (
      if EXIST "..\%%a\%%f" (
        echo svn %1 "..\%%a\%%f"���܂�
      ) else (
        echo �t�H���_..\%%a\%%f���Ȃ����߃X�L�b�v���܂�
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
