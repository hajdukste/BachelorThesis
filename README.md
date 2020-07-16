# Pokyny ke spuštění zdrojového kódu SageMath
1. Nejprve stáhneme jeden ze dvou zdrojových kódů v textovém tvaru, a to kliknutím pravým tlačítkem na následující odkaz a zvolením možnosti "Uložit jako..." [testovaniSystemu.txt](https://raw.githubusercontent.com/StefanHajduk/BachelorThesis/master/testovaniSystemu.txt), [vykresleniMnozinyV.txt](https://raw.githubusercontent.com/StefanHajduk/BachelorThesis/master/vykresleniMnozinyV.txt)
2. Otevřeme stáhnutý soubor v poznámkovém bloku a označíme veškerý text, např. zkratkou Ctrl+A, a zkopírujeme ho zkratkou Ctrl+C
3. Otevřene stránku https://sagecell.sagemath.org/, kde se nachází online překladač pro zdrojové kódy SageMath
4. Vložíme obsah schránky do textového pole na stránce a klikneme na tlačítko Evaluate
5. V poli pod kódem se objeví výsledek
6. Pro volbu jiného numeračního systému je potřeba se dostat na začátek kódu a "zapoznámkovat" řádek, kde je používaný numerační systém, a "odpoznámkovat" jiný numerační systém
7. Řádek se "zapoznámkovává" vložením symbolu # na začátek řádku, "odpoznámkovává" se odstraněním tohoto symbolu
8. Současně může být odpoznámkován pouze jeden numerační systém!
9. Pokud bychom chtěli z výchozí volby zvolit Modifikovany Penneyho system, začátek kódu by měl vypadat takto
```console
# Penneyho system
#(M, A) = (matrix(QQbar, [[-1, -1], [1, -1]]), [vector([0, 0]),vector([1,0])])

# Modifikovany Penneyho system
(M, A) = (matrix(QQbar, [[1, 1], [-1, 1]]), [vector([0, 0]),vector([1,0])])

# Pozicni system jakozto maticovy system, kde beta = -2 a A = {0, 1}
#(M, A) = (matrix(QQbar, [[-2]]), [vector(QQ, [0]), vector(QQ, [1])])

# Eisensteinuv system
#(M, A) = (matrix(QQbar, [[-1, -1], [1, -2]]), [vector([0, 0]), vector([1, 0]), vector([2, 0])])

# Eisensteinuv system se symetrickou abecedou
#(M, A) = (matrix(QQbar, [[-1, -1], [1, -2]]), [vector([0, 0]), vector([1, 0]), vector([-1, 0])])

# Tridimenzionalni system z [7] s a=0 a abecedou obsahujici vektor (1,0,0)
#(M, A) = (matrix(QQbar, [[0, 0, -2], [1, 0, 0], [0, 1, 0]]), [vector([0, 0, 0]),vector([1, 0, 0])])

# Ctyrdimenzionalni system z [7] pro b = 2 a a=0
#(M, A) = (matrix(QQbar, [[0, 0, 0, -2], [1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0]]), [vector([0, 0, 0, 0]),vector([1, 0, 0, 0])])
```
