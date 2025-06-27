set TOWARY;

param TonNaGodzine{TOWARY};
param Cena{TOWARY};
param MaxTon{TOWARY};

param CzasDostepny;

var Godziny{j in TOWARY} >= 0;

maximize zysk:
	sum{j in TOWARY} (Godziny[j] * TonNaGodzine[j]) * Cena[j];
	
subject to CzasCalkowity:
	sum{j in TOWARY} Godziny[j] <= CzasDostepny;

subject to MaksProdukcji{j in TOWARY}:
	Godziny[j] * TonNaGodzine[j] <= MaxTon[j]; 