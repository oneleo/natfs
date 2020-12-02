:: Run as administrator through CMD.exe
@echo off
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command " [System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
netsh advfirewall firewall add rule name="Port 5222" dir=in action=allow protocol=TCP localport=5222
netsh advfirewall firewall add rule name="Port 443" dir=in action=allow protocol=TCP localport=443
choco install googlechrome chrome-remote-desktop-host google-drive-file-stream dontsleep.install -y
::"%ProgramFiles%\Google\Chrome\Application\chrome.exe" --new-window --incognito --app="https://remotedesktop.google.com/access"
"%ProgramFiles%\Google\Chrome\Application\chrome.exe" "https://remotedesktop.google.com/access"
"%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" "https://remotedesktop.google.com/access"
::pause