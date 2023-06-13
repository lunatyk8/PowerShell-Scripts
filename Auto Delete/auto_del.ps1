[string[]]$_users = Get-ADUser -Filter * -Properties *  | Where-Object {$_.Lastlogondate -lt (get-date).ADDDays(-180)}


Write-Output "Czy chcesz usunac tych uzytkownikow" + $_users

[int]$_delete = Read-Host "1-YES/ 0-NO "

if($_delete){
    foreach($_ in $users | Select-Object -ExpandProperty Identity){
        Remove-ADUser -Identity $_ -Confirm:$false
    }
}