[string[]]$_users = Get-ADUser -Filter * -Properties *  | Where-Object {$_.Lastlogondate -lt (get-date).ADDDays(-30)}

Write-Output "Czy chcesz zablokowac tych uzytkownikow" + $_users

[int]$_block = Read-Host "1-YES, 0-NO"

if($_block){
    foreach($_ in $_users | Select-Object -ExcludeProperty Identity){
        Set-ADUser -Identity $_ -Enabled $false
    }
}