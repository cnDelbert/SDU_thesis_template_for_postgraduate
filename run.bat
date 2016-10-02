@ECHO OFF

SET FILENAME=SDUthesistemplate
SET XL=xelatex
::SET BT=bibtex
SET PL=pdflatex

%XL% %~dp0%FILENAME%
::%BT% %~dp0%FILENAME%.aux
%PL% %~dp0%FILENAME%
%PL% %~dp0%FILENAME%
pause
CALL clean
