@echo off
@chcp 65001
@setlocal enableextensions enabledelayedexpansion
@set /a n=0
for /f "tokens=3 delims=	" %%i in ('Type %1^| Find "/youtu."') do (
	@set /a "n=n+1"
	echo !n!:	%%i>>numberedList.txt
	echo %%i>>rawList.txt
)
sort /uniq rawList.txt /o rawList.sorted.txt
del rawList.txt
@set /a m=0
for /f %%j in (rawList.sorted.txt) do (
	set /a "m=m+1"
	echo !m!:	%%j>>numberedsortedList.txt
)
set /a "d=n-m"
echo 原檔多出!d!行
set n=
set m=
endlocal