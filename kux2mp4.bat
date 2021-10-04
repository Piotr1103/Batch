@echo off
echo;
echo 请拖入单个kux文件或整个kux文件夹到此窗口，然后按回车键:
echo;
echo 【注意】
echo;
echo 一、已经转换成功后的mp4文件保存在原kux文件目录中！
echo;
echo 二、每次转换时只能拖入一个kux文件或一个kux文件夹(批量)！
echo;
echo 三、bin文件夹不能更名且必须和kux2mp4.bat文件位于同一目录！
echo;

set /p dir=
set ffmpeg="%~dp0bin\ffmpeg.exe"

echo %dir%|findstr "\\*.kux">nul 2>nul

if %errorlevel% equ 0 (goto A) else (goto B)
pause
exit

::只拖入一个.kux档时
:A
for %%i in (%dir%) do (
	echo ¿ªÊ¼×ª»» %%~i
	%ffmpeg% -y -i "%%~i" -c:a copy -c:v copy -threads 2 "%%~dpni.mp4"
)
pause
exit

::拖入一个含有.kux档的目录时
:B
for %%i in (%dir%\\*.kux) do (
	echo ¿ªÊ¼×ª»» %%i
	%ffmpeg% -y -i "%%i" -c:a copy -c:v copy -threads 2 "%%~dpni.mp4"
)
pause
exit