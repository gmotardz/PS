do{
    try{
        $DL = Read-Host "Enter DL"
        $list_users = @() 
        $list_users = Get-ADGroupMember -Identity "$DL" -Recursive |
        Get-ADUser -Properties Mail |
        Select-Object Mail 
        $list_users | Export-CSV -Path .\file1.csv -notypeinformation 
        (Get-Content .\file1.csv).ToLower() | out-file .\file1.csv
        (Import-Csv .\file1.csv).Mail -replace '^.*$', '"$&"' -join "," > .\file2.txt
        code .\file2.txt
        }
    catch {Write-Warning "$DL does not exist, please input a valid Distribution List."}
}   until ($list_users) 

Write-Host "File created, copy contents."