set Zaklady;
set Sklady;

param MozliwosciProdukcyjne{Zaklady};
param ZapotrzebowaniaSkladow{Sklady};
param KosztyTransportu{Sklady, Zaklady};

var v{i in Sklady, j in Zaklady} >=0;

minimize Koszty:
	sum{i in Sklady, j in Zaklady} v[i,j] * KosztyTransportu[i,j];
	
subject to LimitProdukcyjny{j in Zaklady}:
	sum{i in Sklady} v[i,j] <= MozliwosciProdukcyjne[j];
	
subject to WymaganeZapotrzebowanie{i in Sklady}:
	sum{j in Zaklady} v[i,j] = ZapotrzebowaniaSkladow[i];