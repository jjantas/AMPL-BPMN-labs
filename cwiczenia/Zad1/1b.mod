set TOWARY;
set CZASY;

param TonNaGodzine{TOWARY};
param Cena{TOWARY};
param MaxTon{TOWARY};

var v{i in CZASY, j in TOWARY} >=0, <=1, binary;

maximize Zysk:
	sum{i in CZASY, j in TOWARY} v[i,j] * TonNaGodzine[j] * Cena[j];
	

subject to Limit{j in TOWARY}:
	sum{i in CZASY} v[i,j] * TonNaGodzine[j] <= MaxTon[j];
	
subject to DwieMaszyny{i in CZASY}:
	sum{j in TOWARY} v[i,j] <= 2;
	

