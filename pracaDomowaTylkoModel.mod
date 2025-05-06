param X := 33;  # pierwsze dwie cyfry indeksu
param Y := 13;  # dwie srodkowe cyfry indeksu
param Z := 56;  # dwie ostatnie cyfry indeksu

#ile ton każdego towaru wyprodukować
var Pret >= 0;
var Katownik >= 0;
var Ceownik >= 0;


maximize Zysk:
    X * Pret + Y * Katownik + Z * Ceownik;


subject to OgraniczenieCzasu:
    (1/200)*Pret + (1/140)*Katownik + (1/120)*Ceownik <= 40;

subject to OgraniczeniePretow:
    Pret <= 4000;

subject to OgraniczenieKatownikow:
    Katownik <= 3000;

subject to OgraniczenieCeownikow:
    Ceownik <= 2500;
