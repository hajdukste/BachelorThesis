# Pokyny ke spuštění zdrojového kódu SageMath
Nejprve stáhneme jeden ze dvou zdrojových kódů, a to kliknutím pravým tlačítkem na následující odkaz a zvolením možnosti "Uložit jako..." [testovaniSystemu.sage](https://raw.githubusercontent.com/StefanHajduk/BachelorThesis/master/testovaniSystemu.sage), [vykresleniMnozinyV.sage](https://raw.githubusercontent.com/StefanHajduk/BachelorThesis/master/vykresleniMnozinyV.sage)

Dále je potřeba stáhnout instalační soubor pro program SageMath:

1. Jsou dvě možnosti, buď klikneme přímo na odkaz [SageMath-9.0-Installer-v0.6.0.exe](https://github.com/sagemath/sage-windows/releases/download/0.6.0-9.0/SageMath-9.0-Installer-v0.6.0.exe)
2. Nebo ninstalační soubor nalezneme na oficiálních stránkách [https://www.sagemath.org/download.html](https://www.sagemath.org/download.html)
[https://github.com/sagemath/sage-windows/releases/](https://github.com/sagemath/sage-windows/releases/)

Následně spustíme instalační soubor, odsouhlasíme podmínky použití a zvolíme místo, kam se program nainstaluje. Poté necháme program nainstalovat, instalace trvá přibližně půl hodiny.

Po úspěšné instalaci se na ploše vytvoří zástupce "SageMath 9.x", který následně spustíme. Poznamenejme, že se vytvoří také zástupce "SageMath 9.x Notebook" a "SageMath 9.x Shell". My budeme pracovat s programem bez přípony.

Po spuštění programu se objeví příkazová řádka přes kterou můžeme spouštět zdrojové kódy s příponou sage, a to příkazem

```console
load("Cesta k souboru.")
```
kde za cestu k souboru dosadíme cestu ke stáhnutému .sage souboru. Pokud jsme uložili soubor do Dokumentů, příkaz vypadá takto, kde za Uzivatele dosadíme jméno uživatele ve Windows.

```console
load("Dokumenty\\testovaniSystemu.sage")
```
