@echo ON

set FFMPEG_FN=ffmpeg-%PKG_VERSION%-win%ARCH%

https://ffmpeg.zeranoe.com/builds/win32/dev/ffmpeg-3.3.3-win32-dev.zip

rem On a version update, change the following SHA256 hashes (win32 and win64)
if %ARCH% == 32 (
    set FFMPEG_SHA256="SHA256(%FFMPEG_FN%-dev.zip)= d586af0c40059d6e1c143d8f1d37d26ffaa38dd729669b3985f3c6ad9f5d52c1"
) else (
    set FFMPEG_SHA256="SHA256(%FFMPEG_FN%-dev.zip)= bd5dd12b50530c9922442082543c1095b04eb092c9eb69fc5fd04c6f27310dbe"
)

rem Download the source and check the SHA256
cd %SRC_DIR%
curl -L -O "https://ffmpeg.zeranoe.com/builds/win%ARCH%/dev/%FFMPEG_FN%-dev.zip"
openssl dgst -sha256 -out sha256.out %FFMPEG_FN%-dev.zip
SET /p DOWNLOADED_SHA256=<sha256.out
if NOT "%DOWNLOADED_SHA256%" == %FFMPEG_SHA256% (
    exit 1
)

rem Extract the archive
7za x %FFMPEG_FN%-dev.zip

rem Copy over the bin, include and lib dirs
robocopy %SRC_DIR%\bin\ %LIBRARY_BIN%\ *.* /E
if %ERRORLEVEL% GEQ 8 exit 1

robocopy %SRC_DIR%\%FFMPEG_FN%-dev\include\ %LIBRARY_INC%\ *.* /E
if %ERRORLEVEL% GEQ 8 exit 1

robocopy %SRC_DIR%\%FFMPEG_FN%-dev\lib\ %LIBRARY_LIB%\ *.* /E
if %ERRORLEVEL% GEQ 8 exit 1

rem Add the licences to the recipe directory
copy "%SRC_DIR%\README.txt" "%RECIPE_DIR%"
mkdir "%RECIPE_DIR%\licenses"
copy "%SRC_DIR%\licenses" "%RECIPE_DIR%\licenses"

exit 0
