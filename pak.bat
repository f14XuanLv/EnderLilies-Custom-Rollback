@echo off
rem Set game directory
set GAME_DIR=C:\Game\Steam\steamapps\common\ENDER LILIES\EnderLilies\Content\Paks

rem Set content path (modify this to your modified files location)
rem Default to local directory
set CONTENT_PATH=Exports

rem Set output file name (can be customized)
set OUTPUT_NAME=EnderLilies_CustomRollback_0_P

rem Set output directory (relative to repo)
set OUTPUT_DIR=.\dist\EnderLilies_CustomRollback

rem Set engine version
set ENGINE_VERSION=GAME_UE4_26

rem Set compression format
set COMPRESSION=Zlib

rem Ensure no extra files are present in the game Paks folder
set "EXTRA_ENTRY="

for /f "delims=" %%F in ('dir /b "%GAME_DIR%"') do (
    if exist "%GAME_DIR%\%%~nxF\" (
        set "EXTRA_ENTRY=%%~nxF\"
        goto :CheckEntriesDone
    ) else (
        call :IsAllowed "%%~nxF"
        if errorlevel 1 (
            set "EXTRA_ENTRY=%%~nxF"
            goto :CheckEntriesDone
        )
    )
)

:CheckEntriesDone
if defined EXTRA_ENTRY (
    echo [ERROR] Found non-native file or folder in game directory: %EXTRA_ENTRY%
    echo Please move custom PAK files or folders out of the game Paks folder before running this script.
    pause
    exit /b 1
)

echo Game Dir: %GAME_DIR%
echo Content Path: %CONTENT_PATH%
echo Output Dir: %OUTPUT_DIR%
echo Output File: %OUTPUT_NAME%
echo Engine Version: %ENGINE_VERSION%
echo Compression: %COMPRESSION%
echo.

rem Check if content folder exists
if not exist "%CONTENT_PATH%" (
    echo [ERROR] Content folder does not exist: %CONTENT_PATH%
    echo Please create folder and put your packed files
    echo.
    echo Tip: You need to maintain game directory structure under content path
    echo Example: %CONTENT_PATH%\EnderLilies\Content\_Zenith\Gameplay\Abilities\s5040_Witch\*.uasset
    echo.
    pause
    exit /b 1
)

echo ========================================
echo Important Notes:
echo 1. Ensure modified files keep original directory structure
echo 2. Example: %CONTENT_PATH%\EnderLilies\Content\...
echo 3. Only include modified files, not all files
echo ========================================
echo.

rem Ensure output directory exists
if not exist "%OUTPUT_DIR%" (
    mkdir "%OUTPUT_DIR%"
)

rem Execute packing command
echo Executing packing...
echo.

rem Save current directory
set "ORIGINAL_DIR=%CD%"

rem Change to exe directory
cd /d "%~dp0Tool\UnrealReZen_V01"

rem Run exe with absolute paths
UnrealReZen.exe ^
    --game-dir "%GAME_DIR%" ^
    --content-path "%ORIGINAL_DIR%\%CONTENT_PATH%" ^
    --engine-version %ENGINE_VERSION% ^
    --output-path "%ORIGINAL_DIR%\%OUTPUT_DIR%\%OUTPUT_NAME%.utoc" ^
    --compression-format %COMPRESSION%

rem Return to original directory
cd /d "%ORIGINAL_DIR%"

echo.
if %ERRORLEVEL% EQU 0 (
    echo [SUCCESS] Packing complete!
    echo Generated files:
    echo   - %OUTPUT_DIR%\%OUTPUT_NAME%.utoc
    echo   - %OUTPUT_DIR%\%OUTPUT_NAME%.ucas
echo   - %OUTPUT_DIR%\%OUTPUT_NAME%.pak
) else (
    echo [ERROR] Packing failed, error code: %ERRORLEVEL%
)

echo.
pause

:IsAllowed
set "TARGET_FILE=%~1"
if /i "%TARGET_FILE%"=="EnderLilies-WindowsNoEditor.pak" exit /b 0
if /i "%TARGET_FILE%"=="EnderLilies-WindowsNoEditor.ucas" exit /b 0
if /i "%TARGET_FILE%"=="EnderLilies-WindowsNoEditor.utoc" exit /b 0
if /i "%TARGET_FILE%"=="global.ucas" exit /b 0
if /i "%TARGET_FILE%"=="global.utoc" exit /b 0
exit /b 1
