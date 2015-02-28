
void setup()
{
//taille du doc 800x800 pixels, et fond de couleur blanche//
size(800,800);
background(250);

//variable ma position X pour cercle//
int mpx;
mpx = 400;
//variable ma position Y pour cercle//
int mpy;
mpy = 400;
//variable de largeur du cercle//
int lar;
lar = 200;
//variable de longueur du cercle//
int lon;
lon = 200;
//variable pour contour, épaisseur de la ligne//
int cont;
cont = 20;


//couleur de la ligne vert sombre//
stroke(5,41,6);

//cercle rempli de vert moyen et gérer épaisseur de la ligne//
fill(57,162,93,150);
strokeWeight(cont-8);
ellipse(mpx,mpy,lar+160,lon+80);

//cercle rempli de vert clair et gérer épaisseur de la ligne//
fill(105,247,153,50);
strokeWeight(cont-3);
ellipse(mpx,mpy,lar+80,lon+280);

//cercle rempli de vert foncé et gérer épaisseur de la ligne//
strokeWeight(cont);
fill(64,96,76);
ellipse(mpx,mpy,lar,lon);
}



