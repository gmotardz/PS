<#>
The script was made entirely to be used as a secondary utility for the lookup of printers in a set of print servers by using its IP Address
You can expand the number of servers as needed, as well as edit the properties that will be output once is run.

     *Please make sure you change the value for the IP address you are trying to search for in ("XXX.XXX.XXX.XXX"),
     as well as making sure the script is running inside a PowerShell ISE elevated environment. 

     
      ~by Gil Mota
</#>

Write-Host -ForegroundColor Cyan "Indexing & searching all print servers"

$ComputerList = "serv01","serv02","serv03"
foreach ($computer in $ComputerList) 

{
Get-Printer -computerName $Computer |
select-object -Property Name, Computername, PortName |
where-object{$_.PortName.Contains("XXX.XXX.XXX.XXX")}
}