
void setup () 
{
  size(500,500);
  background(165,117,131);
  smooth();
}
//décliner des traits sur une longueur
void draw()
{
  noFill();
  for (int posx =0; posx<width; posx = posx+40)
  {
    for (int posY=0; posY<height; posY = posY+40)
    {
      //trait noir
      strokeWeight(25);
      stroke(0);
      strokeCap(SQUARE);
      line(posx,posY,posx+35,posY+35);
      //trait gris foncé
      strokeWeight(20);
      stroke(75,50);
      line(posx+35,posY,posx,posY+35);
      //trait gris plus clair
      strokeWeight(15);
      stroke(125,100);
      line(posx,posY,posx+35,posY+35);
     //trait gris clair
      strokeWeight(10);
      stroke(200,155);
      line(posx+35,posY,posx,posY+35);
      //trait gris plus clair
      strokeWeight(5);
      stroke(255,150);
      line(posx,posY,posx+35,posY+35);
    }
  }
  noLoop();
}


