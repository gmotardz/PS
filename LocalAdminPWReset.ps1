<#>
Make sure to define the new PW and the user account also make sure elevated powershell console is running. 
</#>

$NewPW = ConvertTo-SecureString "INSERTNEWPWHERE" –AsPlainText –Force 
Set-LocalUser –Name INSERTUSERNAME –Password $NewPW  
