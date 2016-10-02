@ECHO OFF
:: clean before run
CALL clean 2>nul 1>nul

SET FILENAME=SDUthesistemplate
SET XL=xelatex
SET LT=latex
::SET BT=bibtex
SET PL=pdflatex

%XL% %~dp0%FILENAME%
::%BT% %~dp0%FILENAME%.aux
%PL% %~dp0%FILENAME%
%PL% %~dp0%FILENAME%
::pause
CALL clean 2>nul 1>nul

start "" %~dp0%FILENAME%.pdf

EXIT