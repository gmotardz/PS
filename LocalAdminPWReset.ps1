<#>
Make sure to define the new PW and the user account
</#>

$NewPW = ConvertTo-SecureString "INSERTNEWPWHERE" –AsPlainText –Force
Set-LocalUser –Name INSERTUSERNAME –Password $NewPW  
