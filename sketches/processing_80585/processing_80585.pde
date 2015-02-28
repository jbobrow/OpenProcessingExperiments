
void setup()
{
  size(300,300);
  background(250);
  smooth();
}

void draw()
{
  //créer une variable
//je déclare une variable de type integrer
int PositionX;
PositionX = 150;

int PositionY;
PositionY = 150;

int Largeur;
Largeur =100;

int Hauteur;
Hauteur =100;

  fill(130,50);
  background(250);
  
  ellipse(PositionX,PositionY,Largeur,Hauteur);
  PositionX = PositionX+10;
  
  ellipse(PositionX,PositionY,Largeur,Hauteur);
   PositionX = PositionX+10;
  
  ellipse(PositionX,PositionY,Largeur,Hauteur);
 PositionX = PositionX+10;

  }
  


