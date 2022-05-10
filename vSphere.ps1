# vSphere.ps1
# Usage
#   1) Call 'Connect-vCenters' to connect simultaneously to all the defined vCenters. 
#   2) Call 'Template-vm' to convert Templates into VM
#   3) Call 'Power-on' to turn on VMs
#   4) Call 'Power-off' to turn off VMs
#   5) Call 'vm-template' to convert VMs back to Templates
#   6) Call 'Disconnect-vCenters' to close all connections

function Connect-vCenters{
$vCenterList = @("XXX", "XXX", "XXX", "XXX")
connect-viserver -server $vCenterList -credential $(Get-Credential) -force
}

function template-vm {
Get-Folder "Templates" | Get-Template | Set-Template -ToVM -Confirm:$false
}

function power-on{
Get-Folder “Templates” | Get-VM |Where-object {$_.powerstate -eq “poweredoff”} | Start-VM -Confirm:$false -RunAsync
}

function power-off{
Get-Folder “Templates” | Get-VM |Where-object {$_.powerstate -eq “poweredon”} | Stop-VM -Confirm:$false -RunAsync
}

function vm-template {
Get-Folder "Templates" | Get-VM | Set-VM -ToTemplate -Confirm:$false
}

function Disconnect-vCenters {
    Disconnect-ViServer -Server * -Force -Confirm:$false
}