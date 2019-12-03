@ECHO OFF
SETLOCAL enabledelayedexpansion

SET what=%1
SET default=joker

IF "%1"=="" GOTO :listprofiles


:start
    IF NOT EXIST ./public/backend-profiles/%what%.json (
        GOTO :notfoundmessage
    )

    CLS

    ECHO [97mStarting [0m[96m%what%[97m![0m

    "C:\Program Files\Git\bin\sh.exe" ./server.sh %what%
    REM npm start %what%

    GOTO :eof

:notfoundmessage
    ECHO.
    ECHO [91mServer profile not found![0m
:listprofiles
    ECHO.
    ECHO Available profiles:

    FOR %%a in (./public/backend-profiles/*.json) DO (
        SET defaulttext=
        SET file=%%~na

        IF "!file!"=="%default%" (
            SET "defaulttext=(default)"
        )

        ECHO     [96m!file![0m !defaulttext!
    )

    ECHO.
    ECHO 0: Exit
    ECHO.

    SET /P what=Load which one? (default: [96m%default%[0m): || SET what=%default%

    IF "%what%"=="0" GOTO :eof

    GOTO :start
