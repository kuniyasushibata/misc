@echo off
setlocal


rem date����/���폜
set d=%date:/=%
rem echo %d%

rem ���Ԃ�hh:mn:ss�`���Ŏ擾����A�X�y�[�X��0�Œu������
set time_tmp1=%time: =0%
rem echo %time_tmp1%

rem :���폜
set time_tmp2=%time_tmp1::=%
rem echo %time_tmp2%

rem �擪����6�������o��
set t=%time_tmp2:~0,6%
rem echo %t%

set folder=%d%%t%

echo �����[�X�t�H���_
echo %~dp0%folder%
choice /M ���쐬���܂���?

if %errorlevel% == 2 goto ERROR


endlocal
pause
exit /B

:ERROR
echo �I�����܂�
endlocal
pause
exit /B
