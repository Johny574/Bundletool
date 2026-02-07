@echo off
echo === BundleTool APK Builder ===

:: Prompt user for inputs
set bundletool=bundletool-all-1.18.3.jar
set /p bundlepath="Enter path to .aab file: "
set /p outpath="Enter output path (e.g. app.apks): "
set /p keystorepath="Enter keystore path: "
set /p keystorealias="Enter keystore alias: "
set /p keystorepass="Enter keystore password: "
set /p keypass="Enter key password: "

echo.
echo Building APKs...
echo.

:: Run bundletool
java -jar "%~dp0\%bundletool%" build-apks ^
  --bundle="%bundlepath%" ^
  --output="%outpath%" ^
  --ks="%keystorepath%" ^
  --ks-key-alias="%keystorealias%" ^
  --ks-pass=pass:"%keystorepass%" ^
  --key-pass=pass:"%keypass%"

:: Check if command succeeded
if %ERRORLEVEL% neq 0 (
  echo.
  echo ❌ Failed to build APKs. Please check your inputs.
  pause
  exit /b %ERRORLEVEL%
)

echo.
echo ✅ APKs built successfully: %outpath%
pause
