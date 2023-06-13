Funkcje zawarte w module skanuja komputer docelowy pod katem najczesciej uzywanych portow lub portow wymienonych przez uzytkownika.



Jak korzystac

1. uruchom powershella z uprawnieniami admina
2. przejdz do miejsca w ktorym jest plik PortScanner.psm1
3. Wykonaj komende Import-Module .\PortScanner.psm1 -Verbose
4. Zaimportowales wlasnie funkcje z modulu 
5. Aby sprawdzic co robia funkcje wykonaj komende Help <nazwa-funkcji> przyklad.: Help Get-NetPortByInput

W momencie zamkniecia powershella utracisz sesje i modul zniknie, a cala procedure z importem trzeba wykonac ponownie



Szybsze wykonywanie operacji

Domyslnie funkcje korzystaja z Test-NetConnection, ale jezeli chcesz przyspieszy wykonywanie:

1. Funkcji Get-NetPortByBasic musisz:
1.1 Odkomentowac linijke od 20 do 25 z 20 i 25 lacznie
1.2 zakomentowac linijke 27

2. Funkcji Get-NetPortByInput musisz:
2.1 Odkomentowac linijke od 118 do 123 z 118 i 123 lacznie
2.2 zakomentowac linijke 125



Uwagi:

Jezeli chcesz sie dowiedziec jak automatycznie importowac modul po uruchomieniu powloki powershell to 
wpisz w przegladarce creating profile for powershell
