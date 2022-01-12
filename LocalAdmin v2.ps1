<#>
Make sure to define values for the variables. 
       *elevated powershell console required, might add function to test for admin privilages in later release*. 
~by Gil Mota
</#>

# TESTING PRIVILEGES #
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
# VARIABLE DECLARATION #
$Account = "XXXX"
$AccObject = Get-LocalUser -name $Account -ErrorAction SilentlyContinue
$NewPassword = ConvertTo-SecureString "XXXX" –AsPlainText –Force

# START OF SCRIPT #
if (($AccObject))  { 
    Set-LocalUser –Name $Account –Password $NewPassword 
}
exit

# CLEANUP # 
remove-item -path "C:\Windows\Temp\*" -Force
Restart-Computer -Force 

