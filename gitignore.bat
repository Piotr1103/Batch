for %%i in (.pyc __pycache__ staticfiles "one more file.txt") ^
do if not "%%~ni" == "" (echo %%~i)>>.gitignore ^
else (echo *%%~i)>>.gitignore
rem for %i in (.pyc __pycache__ staticfiles "one more file.txt") ^
rem do @if not "%~ni" == "" (echo %~i)>>.gitignore ^
rem else (echo *%~i)>>.gitignore
rem for %i in (.pyc __pycache__ staticfiles "one more file.txt") do @if not "%~ni" == "" (echo %~i)>>.gitignore else (echo *%~i)>>.gitignore

rem %~ni 为纯档名，不包含副档名。
rem %~i 打印出不含引号的档名。
rem ^ 为命令折叠号，前方必须空一格。