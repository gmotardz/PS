<#>
Make sure to define values for the variables. 
       *elevated powershell console required, might add function to test for admin privilages in later release*. 

~by Gil Mota
</#>

# VARIABLE DECLARATION #
$Account = "XXXX"
$NewPassword = ConvertTo-SecureString "XXXX" –AsPlainText –Force

# START OF SCRIPT #
Get-LocalUser -name $Account

if (($Account) -eq $true)  {
} else {
    Set-LocalUser –Name $Account –Password $NewPassword 
}
exit

# CLEANUP # 
remove-item -path "C:\Temp\*" -Force
Restart-Computer -Force 

Exit-PSSession
