<#>
Work in progress. Has not been fully tested. Might cmdlet to robocopy due to permissions. 
</#>

$folderName = "$env:COMPUTERNAME-"+(Get-Date –f "MM-dd-yyyy")
$Destination = New-Item -ItemType Directory -Path insert destination path here -Name $folderName

Copy-Item -Path insert target path here -Destination $Destination -Recurse

