chcp 65001
@setlocal enableextensions enabledelayedexpansion
@echo off
@set /a n=0
for /f "tokens=3 delims=	" %%i in ('Type %1^| Find "/youtu."') do (
	@set /a "n=n+1"
	echo !n!:	%%i>>numberedList.txt
	echo %%i>>rawList.txt
)
set n=
endlocal
sort /uniq %1 /o %1.sorted.txt