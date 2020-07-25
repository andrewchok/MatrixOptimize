@echo off
cls

echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo Running Matrix Row Vs Column Tests
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:Debug_Win32_tests
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd %~dp0\Optimize\bin\Win32\Debug
if exist Optimize.exe (
	echo Debug Win32 tests:
	for %%w in (2 4 8 16 32 64 128 256 512) do (
		echo Width %%w: running tests...
		Optimize.exe %%w
	)
	goto :Release_Win32_tests
)
echo Error: Debug Win32 not built.

:Release_Win32_tests
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd %~dp0\Optimize\bin\Win32\Release
if exist Optimize.exe (
	echo Release Win32 tests:
	for %%w in (2 4 8 16 32 64 128 256 512) do (
		echo Width %%w: running tests...
		Optimize.exe %%w
	)
	goto :Debug_x64_tests
)
echo Error: Release Win32 not built.

:Debug_x64_tests
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd %~dp0\Optimize\bin\x64\Debug
if exist Optimize.exe (
	echo Debug x64 tests:
	for %%w in (2 4 8 16 32 64 128 256 512) do (
		echo Width %%w: running tests...
		Optimize.exe %%w
	)
	goto :Release_x64_tests
)
echo Error: Debug x64 not built.

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