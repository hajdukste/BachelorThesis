# Pokyny ke spuštění zdrojového kódu SageMath
1. Nejprve stáhneme jeden ze dvou zdrojových kódů, a to kliknutím pravým tlačítkem na následující odkaz a zvolením možnosti "Uložit jako..." [testovaniSystemu.sage](https://raw.githubusercontent.com/StefanHajduk/BachelorThesis/master/testovaniSystemu.sage), [vykresleniMnozinyV.sage](https://raw.githubusercontent.com/StefanHajduk/BachelorThesis/master/vykresleniMnozinyV.sage)

2. Dále je potřeba stáhnout instalační soubor pro program SageMath:

   - Jsou dvě možnosti, buď klikneme přímo na odkaz [SageMath-9.0-Installer-v0.6.0.exe](https://github.com/sagemath/sage-windows/releases/download/0.6.0-9.0/SageMath-9.0-Installer-v0.6.0.exe), nebo instalační soubor nalezneme na oficiálních stránkách [https://www.sagemath.org/download.html](https://www.sagemath.org/download.html)
[https://github.com/sagemath/sage-windows/releases/](https://github.com/sagemath/sage-windows/releases/)

3. Následně spustíme instalační soubor, odsouhlasíme podmínky použití a pro jednodušší instalaci necháme výchozí pracovní složku. Měla by mít tvar
```console
load("C\Users\JmenoUzivatele")
```
   Poté necháme program nainstalovat, instalace trvá přibližně půl hodiny.

4. Po úspěšné instalaci se na ploše vytvoří zástupce "SageMath 9.x", který následně spustíme. Poznamenejme, že se vytvoří také zástupce "SageMath 9.x Notebook" a "SageMath 9.x Shell". My budeme pracovat s programem bez přípony.

5. Po spuštění programu se objeví příkazová řádka přes kterou můžeme spouštět zdrojové kódy s příponou sage, a to příkazem

```console
load("Cesta k souboru.")
```
kde za cestu k souboru dosadíme cestu ke stáhnutému .sage souboru. Pokud jsme uložili soubor do Dokumentů, příkaz vypadá takto

```console
load("Documents\\testovaniSystemu.sage")
```
6. 
