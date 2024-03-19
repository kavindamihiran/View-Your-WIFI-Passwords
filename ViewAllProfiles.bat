@echo off

Rem | Grab all profiles
for /f "tokens=4,* skip=4" %%a in ('netsh wlan show profile') do (

    Rem | Grab key for each profile
    for /f "tokens=*" %%c in ('netsh wlan show profile "%%b" key^=clear') do (

        Rem | Grab only key
        for /f "tokens=3,*" %%d in ('echo %%c^| find /i "Key Content"') do (

            Rem | Display & Record key
            echo [WIFI-NAME: %%b] [CURRENT-PASSWORD: %%e]

        )
    )
)

@echo
@echo ___________________________________
@echo Congratulations!
@echo ___________________________________
pause
