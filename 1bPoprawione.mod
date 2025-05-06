set TOWARY;
set CZASY;

param TonNaGodzine{TOWARY};  # ile ton dany towar można wyprodukować w godzinę
param Cena{TOWARY};           # cena za tonę
param MaxTon{TOWARY};         # maksymalna ilość ton możliwa do wyprodukowania w tygodniu

var h{i in CZASY, j in TOWARY} >= 0, <= 1;  # ile godzin maszyna j pracuje w godzinie i (ułamki dopuszczalne)
var active{i in CZASY, j in TOWARY} binary;   # czy maszyna j jest aktywna w godzinie i


maximize Zysk:
    sum{i in CZASY, j in TOWARY} h[i,j] * TonNaGodzine[j] * Cena[j];


subject to MaksymalnaProdukcja{j in TOWARY}:
    sum{i in CZASY} h[i,j] * TonNaGodzine[j] <= MaxTon[j];

# powiązanie czasu pracy z aktywnością binarną
subject to PowiazanieAktywnosci{i in CZASY, j in TOWARY}:
    h[i,j] <= active[i,j];


subject to Max2Maszyny{i in CZASY}:
    sum{j in TOWARY} active[i,j] <= 2;
