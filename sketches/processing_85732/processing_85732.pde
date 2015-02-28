
/*deux fonctions SETUPE et DRAW , pour declarer une fonction
Smooth sert a lisser pour eviter les creaneaux de pixel */

void setup()

{
  size(250,250);
  background(175,115,154);
  smooth();
}


void draw()
{
  
  int MaPositionX;
 MaPositionX = 200;
 
 int MaPositionY;
 MaPositionY = 150;
 
 
  background(250);
  fill(127,50);
  ellipse(MaPositionX,MaPositionY,50,50);
  MaPositionX = +10;
  ellipse(MaPositionX,MaPositionY,60,60);
  MaPositionX = +10;
  ellipse(MaPositionX,MaPositionY,70,70);
  MaPositionX = +10;
  ellipse(MaPositionX,MaPositionY,90,90);
  MaPositionX = +10;
  ellipse(MaPositionX,MaPositionY,120,120);
  MaPositionX = +10;
 
//je declare une variable de type integer(nombre entier)




//mouseX et mouseY servent a faire des ellipses aléatoire avec la souris sur 
//document


println(mouseX);
}
// on peux mettre une variante ou l'on veut




