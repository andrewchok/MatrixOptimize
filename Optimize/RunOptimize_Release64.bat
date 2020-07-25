@echo off
cls

echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo Running Matrix Row Vs Column Tests
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:Release_x64_tests
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd %~dp0\Optimize\bin\x64\Release
if exist Optimize.exe (
	echo Release x64 tests:
	for %%w in (2 4 8 16 32 64 128 256 512) do (
		echo Width %%w: running tests...
		Optimize.exe %%w
	)
	goto :end
)
echo Error: Release x64 not built.

:end
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

pause