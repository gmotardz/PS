<#>
Make sure to define values for the variables. 
       *elevated powershell console required, might add function to test for admin privilages in later release*. 
~by Gil Mota
</#>


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

