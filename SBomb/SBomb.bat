@echo off
title Connecting...
::Intro to make it look cooler
 ::Credits
:Credits
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                  [90mS[0m[91mBomb[0m created by D
timeout /t 1 /nobreak > nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                  [90mS[0m[91mBomb[0m created by Da
timeout /t 1 /nobreak > nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                  [90mS[0m[91mBomb[0m created by Dar
timeout /t 1 /nobreak > nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                  [90mS[0m[91mBomb[0m created by Dark
timeout /t 1 /nobreak > nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                 [90mS[0m[91mBomb[0m created by DarkR
timeout /t 1 /nobreak > nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                  [90mS[0m[91mBomb[0m created by DarkRe
timeout /t 1 /nobreak > nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                  [90mS[0m[91mBomb[0m created by DarkRea
timeout /t 1 /nobreak > nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                  [90mS[0m[91mBomb[0m created by DarkReap
timeout /t 1 /nobreak > nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                  [90mS[0m[91mBomb[0m created by DarkReape
timeout /t 1 /nobreak > nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                  [90mS[0m[91mBomb[0m created by DarkReaper
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo [32mConnecting...[0m
timeout /t 3 /nobreak > nul
:Intro
title SBomb by DarkReaper
:SBomb
cls
setlocal enabledelayedexpansion
chcp 65001 >nul

:: Twilio API credentials
set "ACCOUNT_SID=Your_Twilio_Account_SID"
set "AUTH_TOKEN=Your_Twilio_Auth_Token"
set "TWILIO_NUMBER=Your_Twilio_Phone_Number"

:: The Menu
:SBombmain
cls
echo.
call :banner

:: Get the recipient's phone number
:choosearecipient1
echo.
echo [93mProvide Phone Number details.[0m       
set /p cc=Country Code [96m(+XX): [0m
set /p number=[0mTarget Number:[94m
set "PHONE_NUMBER=+%cc%%number%"
goto :choosearecipient2

:: Second choosearecipient because of the design.
:choosearecipient2
cls
call :banner
echo.
echo [93mPhone Number details[0m
echo Country Code [96m(+%cc%)[0m
echo Target Number: [94m%number%[0m
goto :Your_Message

:: Get the message to send
:Your_Message
echo.
set /p MESSAGE=[91mEnter your message: [0m
goto :How_Many_Messages

:: Ask how many messages to send
:How_Many_Messages
echo.
set /p MSG_COUNT=[91mHow many messages would you like to send? : [0m

:: Send the SMS using curl
for /l %%i in (1,1,%MSG_COUNT%) do (
    echo Sending SMS %%i...
    curl -X POST "https://api.twilio.com/2010-04-01/Accounts/%ACCOUNT_SID%/Messages.json" ^
        --data-urlencode "To=!PHONE_NUMBER!" ^
        --data-urlencode "From=%TWILIO_NUMBER%" ^
        --data-urlencode "Body=%MESSAGE%" ^
        -u "%ACCOUNT_SID%:%AUTH_TOKEN%" >nul 2>error.log

    if errorlevel 1 (
        echo Error sending SMS via Twilio. Check error.log for details.
        pause
        goto :end
    )
)

:: Results
cls
echo [92m============================[0m
echo [92mAll SMS Messages Sent![0m
echo [93mTo[0m: [94m!PHONE_NUMBER![0m
echo [93mTotal Messages Sent[0m: [91m%MSG_COUNT%[0m
echo [93mYour Message[0m: [1m%MESSAGE%[0m
echo [92m============================[0m
echo.
echo Want to go to Main Menu? (if not then the script will exit)
set /p results=(Y/N):
if /i "%results%"=="Y" goto :SBombmain
if /i "%results%"=="N" goto :end

:end
endlocal
exit /b

:banner
cls
echo.
echo [35m ███████╗██████╗  ██████╗ ███╗   ███╗██████╗ 
echo [35m ██╔════╝██╔══██╗██╔═══██╗████╗ ████║██╔══██╗
echo [35m ███████╗██████╔╝██║   ██║██╔████╔██║██████╔╝
echo [36m ╚════██║██╔══██╗██║   ██║██║╚██╔╝██║██╔══██╗
echo [36m ███████║██████╔╝╚██████╔╝██║ ╚═╝ ██║██████╔╝
echo [36m ╚══════╝╚═════╝  ╚═════╝ ╚═╝     ╚═╝╚═════╝ 
