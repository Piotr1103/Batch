set "file=%CD%\%1"
sort "%file%">"%file%.sorted"
del /q "%file%"

FOR /F "tokens=*" %%A IN (%file%.sorted) DO (
SETLOCAL EnableDelayedExpansion
	if not [%%A]==[!LN!] (
		set "ln=%%A"
		echo %%A>>"%file%"
	)
)
ENDLOCAL

del /q "%file%.sorted"