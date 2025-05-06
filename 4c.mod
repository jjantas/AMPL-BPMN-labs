set Wkrety;
set Maszyny;

param IloscDoWytworzenia{Wkrety};
param CzasTworzenia{Maszyny, Wkrety};


var IleElementowWyprodukowala{i in Maszyny, j in Wkrety} >= 0, integer;
var MaxCzasPracy >= 0;

minimize NajdluzejDzialajacaMaszyna:
	MaxCzasPracy;
	
subject to CzasMaszyny{i in Maszyny}:
	sum{j in Wkrety} IleElementowWyprodukowala[i,j] * CzasTworzenia[i,j] <= MaxCzasPracy;

subject to MinimalnyCzasPracy{i in Maszyny}:
	sum{j in Wkrety} IleElementowWyprodukowala[i,j] * CzasTworzenia[i,j] >= 10;


subject to MinimalneZapotrzebowanie{j in Wkrety}:
	sum{i in Maszyny} IleElementowWyprodukowala[i,j] = IloscDoWytworzenia[j];
	 

