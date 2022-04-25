
 function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    if ($elevated) {
        # tried to elevate, did not work, aborting
    } else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit
}
 
try {
    # Variable Declaration
    $Url = 'https://go.microsoft.com/fwlink/?LinkID=799445'
    $Directory = 'C:\Tool'
    $Tool = "$($Directory)\WinUpgrade.exe"
    $Arguments = '/quietinstall /skipeula /auto upgrade'
    $web = New-Object System.Net.WebClient
    $regpath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE"
 
    # Testing Path
    if (!(Test-Path $Directory)) {
        New-Item -ItemType Directory -Path $Directory
    }
    if (Test-Path $Tool) {
        Remove-Item -Path $Tool -Force
    }
    # Win10 Upgrade Assitant Tool Download
    $web.DownloadFile($Url, $Tool)
 
    # Testing for tool and execute
    if (Test-Path $Tool) {
        Start-Process -FilePath $Tool -ArgumentList $Arguments -wait
    }
}
finally {
    New-ItemProperty -path $regpath -name "DisablePrivacyExperience" -value 1
    Start-Sleep -s 300
    Restart-Computer -Force
}

