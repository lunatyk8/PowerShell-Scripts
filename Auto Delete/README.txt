Skrypt kasuje uzytkownikow, ktorzy nie logowali sie od 180 dni. Dziala on tylko na domenie AD.

Aby go uruchomic nalezy ustawic polityke skryptow na Bypass.
Mozna to zrobic uruchamiajac konsole PowerShell z uprawnieniami administratora i wydajac polecenie

Set-ExecutionPolicy Bypass


Skrypt usunie tez konta utworzone przez AD i przez system, wiec trzeba miec to na uwadze.