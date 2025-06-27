set WARZYWA;
set PRODUCENCI;
set MAGAZYNY;
set SKLEPY;
set TYGODNIE;




param ProdukcjaRoczna{i in PRODUCENCI, j in WARZYWA};
param PojemnoscMagazynow{i in MAGAZYNY};
param PojemnoscMagazynowPrzysklepowych{i in SKLEPY};
param OdleglosciProducentowOdMagazynow{i in PRODUCENCI, j in MAGAZYNY};
param OdlegloscMagazynowOdSklepow{i in MAGAZYNY, j in SKLEPY};
param CenaTransportuZaKilometr;
param MinimalnyZapas{i in SKLEPY, j in WARZYWA};
param TygodniowaSprzedazSprzedRoku{i in TYGODNIE, j in SKLEPY, k in WARZYWA};


var TransProdMag {p in PRODUCENCI, m in MAGAZYNY, w in WARZYWA} >= 0;
var TransMagSklep {m in MAGAZYNY, s in SKLEPY, w in WARZYWA, t in TYGODNIE} >= 0;
var ZapasPrzysklepowy {s in SKLEPY, w in WARZYWA, t in TYGODNIE} >= 0;


minimize KosztTransportu:
    sum {p in PRODUCENCI, m in MAGAZYNY, w in WARZYWA}
        TransProdMag[p,m,w] * OdleglosciProducentowOdMagazynow[p,m] * CenaTransportuZaKilometr
    +
    sum {m in MAGAZYNY, s in SKLEPY, w in WARZYWA, t in TYGODNIE}
        TransMagSklep[m,s,w,t] * OdlegloscMagazynowOdSklepow[m,s] * CenaTransportuZaKilometr;
        

subject to PokryciePopytuT1 {s in SKLEPY, w in WARZYWA}:
    sum {m in MAGAZYNY} TransMagSklep[m,s,w,1]
    = TygodniowaSprzedazSprzedRoku[1,s,w] + ZapasPrzysklepowy[s,w,1];

subject to PokryciePopytuT2plus {s in SKLEPY, w in WARZYWA, t in TYGODNIE: t > 1}:
    ZapasPrzysklepowy[s,w,t-1] + sum {m in MAGAZYNY} TransMagSklep[m,s,w,t]
    = TygodniowaSprzedazSprzedRoku[t,s,w] + ZapasPrzysklepowy[s,w,t];



subject to OgraniczenieMagazynuSklepowego {s in SKLEPY, t in TYGODNIE}:
    sum {w in WARZYWA} ZapasPrzysklepowy[s,w,t] <= PojemnoscMagazynowPrzysklepowych[s];


subject to MinimalnyZapasPrzysklepowy {s in SKLEPY, w in WARZYWA, t in TYGODNIE}:
    ZapasPrzysklepowy[s,w,t] >= MinimalnyZapas[s,w];


subject to PojemnoscMagazynowCentralnych {m in MAGAZYNY}:
    sum {p in PRODUCENCI, w in WARZYWA} TransProdMag[p,m,w] <= PojemnoscMagazynow[m];


subject to BilansMagazynow {m in MAGAZYNY, w in WARZYWA}:
    sum {p in PRODUCENCI} TransProdMag[p,m,w] >=
        sum {s in SKLEPY, t in TYGODNIE} TransMagSklep[m,s,w,t];


subject to OgraniczenieProdukcji {p in PRODUCENCI, w in WARZYWA}:
    sum {m in MAGAZYNY} TransProdMag[p,m,w] <= ProdukcjaRoczna[p,w];


