
void setup()
{size(400,400);
}
void draw()
{background (227,50,56);
fill(255,70);
  //x du cercle
  int cercleX;
cercleX = 200;
//y du cercle
int cercleY;
cercleY = 200;
//taille du cercle
int tailleCercle;
tailleCercle = 300;
int TailleCercle; 
TailleCercle = 300;

ellipse(cercleX,cercleY,tailleCercle,TailleCercle);
tailleCercle = tailleCercle-100; 
TailleCercle = TailleCercle-100;
ellipse(cercleX,cercleY,tailleCercle,TailleCercle);
tailleCercle = tailleCercle-100; 
TailleCercle = TailleCercle-100;
ellipse(cercleX,cercleY,tailleCercle,TailleCercle);
tailleCercle = tailleCercle-100; 
TailleCercle = TailleCercle-100;
ellipse(cercleX,cercleY,tailleCercle,TailleCercle);
tailleCercle = tailleCercle-100; 
TailleCercle = TailleCercle-100;
ellipse(cercleX,cercleY,tailleCercle,TailleCercle);

noLoop();}


