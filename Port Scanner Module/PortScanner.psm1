function Get-NetPortByBasic {
    <#
    .SYNOPSIS
    Funkcja sprawdza najczesciej uzywane porty na twoim komputerze i je wyswietla, jezeli, ktorys z nich jest otwarty.
    .DESCRIPTION
    Zaleca sie nie zmieniac zadnych parametrow tej funkcji. Jezeli chcesz sprawdzic inny komputer lub inny port skorzystaj z funkcji Get-NetPortByInput, ktora znajduje sie w tym module
    #>


    param (
        [string[]]$computername = "localhost",

        [int32[]]$ports = @(20,21,22,23,25,53,69,80,88,137,135,139,110,143,443,587,989,990,993,995,1194,3306,3389,5432)
    )


    foreach($computer in $computername){
        foreach($port in $ports){
 
            #try{
            #    [switch]$_open_port = [System.Net.Sockets.TcpClient]::new().ConnectAsync($_computer, $port).Wait(100)
            #}
            #catch{
            #    Write-Host "Blad z portem: $port"
            #}

            [switch]$_open_port = Test-NetConnection -ComputerName $computer -Port $port -InformationLevel Quiet -WarningAction SilentlyContinue

            if($_open_port){
                Write-Host "Host: $computer"
                switch ($port) {

                    20{Write-Warning "Port:$port jest otwarty, FTP - Dane";      Break}
                    21{Write-Warning "Port:$port jest otwarty, FTP - Komendy";   Break}
                    22{Write-Warning "Port:$port jest otwarty, SSH";             Break}
                    23{Write-Warning "Port:$port jest otwarty, Telnet";          Break}
                    25{Write-Host "Port:$port jest otwarty, SMTP";               Break}
                    53{Write-Host "Port:$port jest otwarty, DNS";                Break}
                    69{Write-Host "Port:$port jest otwarty, TFTP";               Break}
                    80{Write-Warning "Port:$port jest otwarty, HTTP";            Break}
                    88{Write-Host "Port:$port jest otwarty, Kerberos";           Break}
                    110{Write-Host "Port:$port jest otwarty, POP3";              Break}
                    135{Write-Host "Port:$port jest otwarty, Microsoft";         Break}
                    137{Write-Host "Port:$port jest otwarty, NetBIOS";           Break}
                    139{Write-Host "Port:$port jest otwarty, NetBIOS";           Break}
                    143{Write-Host "Port:$port jest otwarty, IMAP";              Break}
                    443{Write-Host "Port:$port jest otwarty, 443";               Break}
                    587{Write-Host "Port:$port jest otwarty, SMTP/S";            Break}
                    989{Write-Host "Port:$port jest otwarty, FTP/S - Dane";      Break}
                    990{Write-Host "Port:$port jest otwarty, FTP/S - Komendy";   Break}
                    993{Write-Host "Port:$port jest otwarty, IMAP/S";            Break}
                    995{Write-Host "Port:$port jest otwarty, POP3/S";            Break}
                    1194{Write-Host "Port:$port jest otwarty, OpenVPN";          Break}
                    3306{Write-Warning "Port:$port jest otwarty, MySQL";         Break}
                    3389{Write-Warning "Port:$port jest otwarty, RDP";           Break}
                    5432{Write-Warning "Port:$port jest otwarty, PostgreSQL";    Break}

                }   
            }
            else{
                Write-Host "Port: $port, jest zamkniety dla hosta: $computer"
            }
        }
    }
}




function Get-NetPortByInput {
    <#
    .SYNOPSIS
    Testuje porty, ktore poda uzytkownik na danym komputerze.
    .PARAMETER computername
    Wpisz w to miejsce nazwe komputera lub jego adres IP.
    .PARAMETER ports
    Wpisz w to miejsce numer portu, ktory chesz przetestowac.
    .PARAMETER path
    Wprowadz poprawna sciezke do exportu. Jezeli wprowadzimy tylko jakakolwiek litere badz cyfre to plik utworzy sie w miejscu, gdzie znajduje sie skrypt.
    .EXAMPLE
    PS > Get-NetPortByInput -computername "PC1" -ports 20
    Testuje port "20" dla komputera PC1
    .EXAMPLE
    PS > Get-NetPortByInput -computername "192.168.0.1" -ports 20
    Testuje port "20" dla komputera znajdujacego sie pod adresem "192.168.0.1"
    .EXAMPLE
    PS > Get-NetPortByInput -computername "PC1","PC2","PC3" -ports 20
    Testuje port "20" dla kilku komputerow podanych po przecinku.
    .EXAMPLE
    PS > Get-NetPortByInput -computername "192.168.0.1","192.168.0.2" -ports 20,21,22,23,24,25,26
    Testuje rozne porty dla kilku komputerow podanych przez adres IP
    .EXAMPLE
    PS > Get-NetPortByInput -computername "PC1" -ports 20 -Path c:\plik.txt
    Eskport do pliku
    #>
    


    param (
        [Parameter(Mandatory=$true, Position=0, HelpMessage = "Wprowadz nazwe komputera. Jezeli chcesz zakonczyc wcisnij 2 razy ENTER")]
        [string[]]$computername,
        

        [Parameter(Mandatory=$true, Position=0, HelpMessage = "Wprowadz numer portu. Jezeli chcesz zakonczyc wcisnij 2 razy ENTER")]
        [int32[]]$ports,


        [Parameter (Mandatory=$false)]
        [string]$path

    )
    $_raport = "Host,Port,Status `n"


    foreach($computer in $computername){
        foreach($port in $ports){

            #try{
            #    [switch]$_open_port = [System.Net.Sockets.TcpClient]::new().ConnectAsync($_computer, $port).Wait(100)
            #}
            #catch{
            #    Write-Host "Blad z portem: $port"
            #}

            [switch]$_open_port = Test-NetConnection -ComputerName $computer -Port $port -InformationLevel Quiet -WarningAction SilentlyContinue


            if($_open_port){
                Write-Host "Host: $computer"
                switch ($port) {

                    20{Write-Warning "Port:$port jest otwarty, FTP - Dane";      Break}
                    21{Write-Warning "Port:$port jest otwarty, FTP - Komendy";   Break}
                    22{Write-Warning "Port:$port jest otwarty, SSH";             Break}
                    23{Write-Warning "Port:$port jest otwarty, Telnet";          Break}
                    25{Write-Host "Port:$port jest otwarty, SMTP";               Break}
                    53{Write-Host "Port:$port jest otwarty, DNS";                Break}
                    69{Write-Host "Port:$port jest otwarty, TFTP";               Break}
                    80{Write-Warning "Port:$port jest otwarty, HTTP";            Break}
                    88{Write-Host "Port:$port jest otwarty, Kerberos";           Break}
                    110{Write-Host "Port:$port jest otwarty, POP3";              Break}
                    135{Write-Host "Port:$port jest otwarty, Microsoft";         Break}
                    137{Write-Host "Port:$port jest otwarty, NetBIOS";           Break}
                    139{Write-Host "Port:$port jest otwarty, NetBIOS";           Break}
                    143{Write-Host "Port:$port jest otwarty, IMAP";              Break}
                    443{Write-Host "Port:$port jest otwarty, 443";               Break}
                    587{Write-Host "Port:$port jest otwarty, SMTP/S";            Break}
                    989{Write-Host "Port:$port jest otwarty, FTP/S - Dane";      Break}
                    990{Write-Host "Port:$port jest otwarty, FTP/S - Komendy";   Break}
                    993{Write-Host "Port:$port jest otwarty, IMAP/S";            Break}
                    995{Write-Host "Port:$port jest otwarty, POP3/S";            Break}
                    1194{Write-Host "Port:$port jest otwarty, OpenVPN";          Break}
                    3306{Write-Warning "Port:$port jest otwarty, MySQL";         Break}
                    3389{Write-Warning "Port:$port jest otwarty, RDP";           Break}
                    5432{Write-Warning "Port:$port jest otwarty, PostgreSQL";    Break}
		    Default{Write-Warning "Port:$port jest otwarty"; 		 Break}


                }
            }
            else{
                Write-Host "Port: $port, jest zamkniety dla hosta: $computer"
            }

            if($path){
                $_raport += "$computer,$port,$_open_port" + "`n"
            }
        }
    }
    if($path){
        $_raport | Out-File -FilePath $path
    }
}