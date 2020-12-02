# silentfs: Silent File Server
 A Silent Way to Create Local File Server, Accessible in NAT (Network Address Translation). 

## Require
- None
- Only for Windows OS
- Just only modify this fs `root` directory at [silentfs.cmd](./silentfs.cmd) file in line 18 ~ 19, default setting is `C:\` listening on port `81`, `D:\` listening on port `80` and `E:\` listening on port `82`.

## Installation
```ps
> :: Run the script as administrator through CMD.exe
> cmd
> silentfs.cmd
```