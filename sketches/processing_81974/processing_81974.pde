
void setup()
{
size(400,400);
background(222,219);

//variable ma position X//
int mpx;
mpx = 200;
//variable ma position Y//
int mpy;
mpy = 200;
//variable de largeur//
int lar;
lar = 80;
//variable de longueur//
int lon;
lon = 80;
//variable pour contour//
int cont;
cont = 2;

stroke(54,14,14);
strokeWeight(cont+3);
fill(203,62,62);
ellipse(mpx,mpy,lar,lon);
strokeWeight(cont);
fill(250);
ellipse(mpx-15,mpy,lar-70,lon+85);
ellipse(mpx+15,mpy,lar-70,lon+85);
ellipse(mpx,mpy,lar-70,lon+100);



}


