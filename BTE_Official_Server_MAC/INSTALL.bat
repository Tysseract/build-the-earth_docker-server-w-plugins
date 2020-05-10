@echo off
echo ========================================================
echo !!      NOTE: you need 64-bit Java 8 installed.       !!
echo !! If you don't have java 8, you can download it from !!
echo !!             https://adoptopenjdk.net/              !!
echo !!      You should see your java version below.       !!
echo !!         Or an error if it's not installed          !!
echo !!            Make sure you have java 1.8             !!
echo ========================================================
echo:
java -Xmx2G -version
echo:
echo If you see a "Could not reserve enough space for 2097152KB object heap" above, you need to install 64-bit java 8
if errorlevel 1 goto :FAIL
pause
echo:

wget.exe -4 https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2847/forge-1.12.2-14.23.5.2847-installer.jar -O forge-1.12.2-14.23.5.2847-installer.jar
if errorlevel 1 goto :FAIL
java -jar forge-1.12.2-14.23.5.2847-installer.jar --installServer
if errorlevel 1 goto :FAIL
del forge-1.12.2-14.23.5.2847-installer.jar
IF EXIST "forge.jar" (
  echo Replacing old forge.jar...
  del forge.jar
)
ren forge-1.12.2-14.23.5.2847-universal.jar forge.jar
echo:
echo ==========================================================
echo !!      The server has been installed successfully.     !!
echo !! Before running the server, you need to edit eula.txt !!
echo !!          and change eula=false to eula=true          !!
echo ==========================================================
echo:
pause
goto :EXIT

:FAIL
echo Installation cannot continue due to an error
pause
:EXIT
