:: Open as administrator
@echo off
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command " [System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
netsh advfirewall firewall add rule name="Port 80" dir=in action=allow protocol=TCP localport=80
netsh advfirewall firewall add rule name="Port 81" dir=in action=allow protocol=TCP localport=81
choco install git.install dontsleep.install golang -y
::refreshenv
md %USERPROFILE%\go\src\github.com\codeskyblue
md %USERPROFILE%\go\src\github.com\oneleo
cd /d %USERPROFILE%\go\src\github.com\codeskyblue
"%ProgramFiles%\Git\cmd\git.exe" clone https://github.com/codeskyblue/gohttpserver.git
cd /d %USERPROFILE%\go\src\github.com\oneleo
"%ProgramFiles%\Git\cmd\git.exe" clone https://github.com/oneleo/natfs.git
cd /d %USERPROFILE%\go\src\github.com\codeskyblue\gohttpserver
:: Predict Drive Letter
"%SystemDrive%\Go\bin\go.exe" install
copy "%USERPROFILE%\go\src\github.com\oneleo\natfs\invisible.vbs" "%USERPROFILE%\go\bin\"
"%windir%\System32\wscript.exe" "%USERPROFILE%\go\bin\invisible.vbs" "%USERPROFILE%\go\bin\gohttpserver" --port 80 -r "D:"
"%windir%\System32\wscript.exe" "%USERPROFILE%\go\bin\invisible.vbs" "%USERPROFILE%\go\bin\gohttpserver" --port 81 -r "C:"
pause