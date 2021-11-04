@ECHO OFF

CALL TaishanSignatureConfig.bat

DEL %TSIT_NAME%.pvk 
DEL %TSIT_NAME%.cer
DEL %TSIT_NAME%.spc
DEL %TSIT_NAME%.pfx

REM 会要求输入密码
Makecert -r -a %ALGORITHM% -sv %TSIT_NAME%.pvk ^
    -b %START_DATE% ^
    -e   %END_DATE% ^
    -n  %SIGN_INFO% ^
    %TSIT_NAME%.cer

Cert2spc %TSIT_NAME%.cer %TSIT_NAME%.spc

Pvk2Pfx -pvk %TSIT_NAME%.pvk -pi %PASSWORD% ^
    -spc %TSIT_NAME%.spc -pfx %TSIT_NAME%.pfx -f
