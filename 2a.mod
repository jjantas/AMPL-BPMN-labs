set Browary;
set Hurtownie;

param TygodniowaProdukcjaBrowarow{Browary};
param ZapotrzebowanieHurtowni{Hurtownie};
param KosztyTransportu{Browary, Hurtownie};


var DostarczoneHl{i in Browary, j in Hurtownie} >=0;


minimize Koszty:
	sum{i in Browary, j in Hurtownie} DostarczoneHl[i,j] * KosztyTransportu[i,j];

subject to LimitProdukcji{i in Browary}:
	sum{j in Hurtownie} DostarczoneHl[i,j] <= TygodniowaProdukcjaBrowarow[i];
	
subject to LimitZapotrzebowania{j in Hurtownie}:
	sum{i in Browary} DostarczoneHl[i,j] = ZapotrzebowanieHurtowni[j];