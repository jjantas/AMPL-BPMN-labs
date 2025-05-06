set Wkrety;
set Maszyny;

param IloscDoWytworzenia{Wkrety};
param CzasTworzenia{Maszyny, Wkrety};
param ZuzywanaEnergiaNaJedenElement{Maszyny};

var IleElementowWyprodukowala{i in Maszyny, j in Wkrety} >= 0, integer;

minimize WykorzystanaEnergia:
	sum{i in Maszyny, j in Wkrety} IleElementowWyprodukowala[i,j] * ZuzywanaEnergiaNaJedenElement[i];

subject to MinimalnyCzasPracy{i in Maszyny}:
	sum{j in Wkrety} IleElementowWyprodukowala[i,j] * CzasTworzenia[i,j] >= 10;


subject to MinimalneZapotrzebowanie{j in Wkrety}:
	sum{i in Maszyny} IleElementowWyprodukowala[i,j] = IloscDoWytworzenia[j];
	 

