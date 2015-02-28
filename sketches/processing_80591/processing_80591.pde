

void setup ()
{
//la taille de mon sketch, le fond et le smooth
size(500,500);
background (250);
smooth();
}



//je crée une fonction draw
void draw ()
{
  //je crée en variable les 4 parametres de l'ellipse
int PositionX;
PositionX = 250;

int PositionY;
PositionY = 250;

int Largeur;
Largeur = 50;

int Longeur;
Longeur = 50;

noFill();
//je fais une ellipse avec mes variables
ellipse (PositionX, PositionY,Largeur,Longeur);

//je fais 4 ellipses comme une rosace autour de ellipse1
ellipse (PositionX+25, PositionY,Largeur,Longeur);
ellipse (PositionX-25, PositionY,Largeur,Longeur);
ellipse (PositionX, PositionY-25,Largeur,Longeur);
ellipse (PositionX, PositionY+25,Largeur,Longeur);

//deuxième ellipse centrale et ces elipses imbriquées
ellipse (PositionX, PositionY,Largeur+20,Longeur+20);
ellipse (PositionX+25, PositionY,Largeur+20,Longeur+20);
ellipse (PositionX-25, PositionY,Largeur+20,Longeur+20);
ellipse (PositionX, PositionY-25,Largeur+20,Longeur+20);
ellipse (PositionX, PositionY+25,Largeur+20,Longeur+20);

//je fais une autre série d'ellipse mais alongées
//ellipse (PositionX+25, PositionY,Largeur+40,Longeur);
//ellipse (PositionX-25, PositionY,Largeur+40,Longeur);
//ellipse (PositionX, PositionY-25,Largeur+40,Longeur);
//ellipse (PositionX, PositionY+25,Largeur+40,Longeur);
  
  
noLoop();  
}





