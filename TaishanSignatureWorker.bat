@ECHO OFF

CALL TaishanSignatureConfig.bat

SET DEST_DIR=.

ECHO -
for %%i in (Office.exe      ^
            TPlayerCore.dll ^
           ) ^
do (
    ECHO Sign %%i now!
    IF EXIST %DEST_DIR%\%%i (
        REM 一个命令也可以完成
        REM SignTool sign /v /as /f %TSIT_NAME%.pfx ^
        REM     /p %PASSWORD% /fd %NEW_ALGORITHM%  ^
        REM     /tr %HTTP_TIMESTAMP% ^
        REM     %DEST_DIR%\%%i
        
        REM 为了方便察看，使用两个命令
        SignTool sign      /v /as /f %TSIT_NAME%.pfx ^
            /p %PASSWORD% /fd %ALGORITHM% ^
            %DEST_DIR%\%%i
        SignTool timestamp /tr %HTTP_TIMESTAMP% ^
            %DEST_DIR%\%%i
    )
    ECHO -
)
