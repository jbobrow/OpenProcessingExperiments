
void setup()
{
size(400,400);
background(250);

//variable ma position X//
int mpx;
mpx = 200;
//variable ma position Y//
int mpy;
mpy = 200;
//variable de largeur//
int lar;
lar = 50;
//variable de longueur//
int lon;
lon = 50;
//variable pour contour//
int cont;
cont = 5;

stroke(82,19,19);
fill(237,36,36,150);
strokeWeight(cont-2);
ellipse(mpx,mpy,lar+40,lon+20);
fill(237,36,36,50);
strokeWeight(cont-3);
ellipse(mpx,mpy,lar+5,lon+70);
strokeWeight(cont);
fill(237,36,36);
ellipse(mpx,mpy,lar,lon);
}



