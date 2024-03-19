@echo off
netsh wlan show profiles
set /p wifiname="Please enter the Wi-Fi Name (SSID) exactly as it appears, including uppercase and lowercase letters: "
echo You entered: %wifiname%

@echo off
for /f "tokens=*" %%c in ('netsh wlan show profile %wifiname% key^=clear') do (for /f "tokens=3,*" %%d in ('echo %%c^| find /i "Key Content"') do (
	    
		@echo ___________________________________
		echo CURRENT-PASSWORD: %%e
		@echo ___________________________________
        )

)

@echo Congratulations! 
@PAUSE.
