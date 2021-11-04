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
        REM һ������Ҳ�������
        REM SignTool sign /v /as /f %TSIT_NAME%.pfx ^
        REM     /p %PASSWORD% /fd %NEW_ALGORITHM%  ^
        REM     /tr %HTTP_TIMESTAMP% ^
        REM     %DEST_DIR%\%%i
        
        REM Ϊ�˷���쿴��ʹ����������
        SignTool sign      /v /as /f %TSIT_NAME%.pfx ^
            /p %PASSWORD% /fd %ALGORITHM% ^
            %DEST_DIR%\%%i
        SignTool timestamp /tr %HTTP_TIMESTAMP% ^
            %DEST_DIR%\%%i
    )
    ECHO -
)
