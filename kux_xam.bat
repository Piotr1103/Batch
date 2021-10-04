@echo off
setlocal enabledelayedexpansion
set ffmpeg="C:\Program Files\Youku\nplayer\ffmpeg.exe"
if exist %ffmpeg% (
	for /r . %%i in (*.kux) do (
		%ffmpeg% -y -i "%%i" -c:a copy -c:v copy -threads 2 "%%~dpni.mp4"
	)
) else echo