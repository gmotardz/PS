$NewPassword = ConvertTo-SecureString "INSERTNEWPWHERE" –AsPlainText –Force
Set-LocalUser –Name INSERTUSERNAME –Password $NewPassword 