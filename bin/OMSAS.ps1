#OMSAS v1.0 by QuantumWavves
[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12
$WINVERSION=(Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion").ProductName
function Test-Administrator  
{  
    [OutputType([bool])]
    param()
    process {
        [Security.Principal.WindowsPrincipal]$user = [Security.Principal.WindowsIdentity]::GetCurrent();
        return $user.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator);
    }
}
if(-not (Test-Administrator))
{
    Write-Error "This script must be executed as Administrator.";
    exit 1;
}
$ErrorActionPreference = "Stop";
function AOSD {
    if($WINVERSION -eq "Windows 10 Enterprise LTSC 2021"){StoreLTSC2021}
    if($WINVERSION -eq "Windows 10 Enterprise LTSC 2019"){StoreLTSC2019}
    if($WINVERSION -eq "Windows 10 Enterprise 2016 LTSB"){StoreLTSB2016}
    if($WINVERSION -eq "Windows 10 Enterprise 2015 LTSB"){W10LTSB2015}
    if($WINVERSION -eq "Windows 10 Pro"){StoreProHome}
    if($WINVERSION -eq "Windows 10 Home"){StoreProHome}    
}
function StoreLTSC2021 {
    (New-Object Net.WebClient).DownloadFile("https://github.com/quantumwavves/OMSAS/raw/master/Resources/Store-LTSC2021-2021-11-17-Lite.zip", "$env:temp\2021.zip")
    Expand-Archive -Path $env:temp/2021.zip -DestinationPath $env:temp\2021
    cmd.exe /c "$env:temp\2021\Store-LTSC2021-2021-11-17-Lite\Add-Store.cmd"
}
function StoreLTSC2019 {
    (New-Object Net.WebClient).DownloadFile("https://github.com/kkkgo/LTSC-Add-MicrosoftStore/archive/refs/tags/2019.zip", "$env:temp\2019.zip")
    Expand-Archive -Path $env:temp/2019.zip -DestinationPath $env:temp\2019
    cmd.exe /c "$env:temp\2019\LTSC-Add-MicrosoftStore-2019\Add-Store.cmd"
}
function StoreLTSB2016 {
    (New-Object Net.WebClient).DownloadFile("https://github.com/kkkgo/LTSB-Add-MicrosoftStore/archive/refs/tags/2016.zip", "$env:temp\2016.zip")
    Expand-Archive -Path $env:temp/2016.zip -DestinationPath $env:temp\2016
    cmd.exe /c "$env:temp\2016\LTSB-Add-MicrosoftStore-2016\Add-Store.cmd"
}
function StoreProHome {
    Get-AppXPackage *WindowsStore* -AllUsers | ForEach-Object {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
    if($? -eq "True"){
        Write-Output "completed"
    }
    else {
        (New-Object Net.WebClient).DownloadFile("https://github.com/quantumwavves/OMSAS/raw/master/Resources/Store-LTSC2021-2021-11-17-Lite.zip", "$env:temp\2021.zip")
        Expand-Archive -Path $env:temp/2021.zip -DestinationPath $env:temp\2021
        cmd.exe /c "$env:temp\2021\Store-LTSC2021-2021-11-17-Lite\Add-Store.cmd"
    }
}
AOSD