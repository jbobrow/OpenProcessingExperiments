

//BREYTUR

size(333, 300);

//fyrst tharf ad skilgreina breytu
int staerd;  //int er heiltala
float innri; //float er tala med aukastofum

//svo tharf ad gefa breytunni gildi
staerd = 100;
innri = 0.7;

//thad er lika haegt ad gera baedi i einu
int x = width/2;
int y = 111;

background(111, 0, 1);
ellipse(x, y, staerd, staerd);
ellipse(x, y, staerd*innri, staerd*innri);

