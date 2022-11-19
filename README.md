# OMSAS
OMSAS (OMSAS is Microsoft Store Add-on Script)

## What is?

## Supported Versions

| Compatibility        |   |
|----------------------|---|
| Windows 11 HOME/PRO  | ✓ |
| Windows 10 HOME/PRO  | ✓ |
| Windows 10 LTSC 2021 | ✓ |
| Windows 10 LTSC 2019 | ✓ |
| Windows 10 LTSB 2016 | ✓ |
| Windows 10 LTSB 2015 | ✓ |

## Usage
```powershell
iwr -useb "cutt.ly/QWOMSAS" | iex
```
#### Issues with TLS/SSL
```powershell
[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; iwr -useb "cutt.ly/QWOMSAS" | iex
```