<#>
Make sure to define the new PW and the user account, *elevated powershell console required*. 
</#>

$NewPW = ConvertTo-SecureString "INSERTNEWPWHERE" –AsPlainText –Force 
Set-LocalUser –Name INSERTUSERNAME –Password $NewPW  
restart-computer -force
