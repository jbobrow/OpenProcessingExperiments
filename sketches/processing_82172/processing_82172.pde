
void setup () {
  size(500, 500);
  background(255);
  smooth();
}
//décliner des traits sur une longueur
void draw()
{
  noFill();
  for (int posx =-2; posx<width; posx = posx+40)
  {
    for (int posY=0; posY<height; posY = posY+40)
    {
      strokeWeight(20);
      stroke(25,460,164);
      line(posx,posY,posx+25,posY+25);
      //traits de l'autre sens
      stroke(25,60,69,150);
      line(posx,posY+25,posx+25,posY);
      stroke(25,460,264);
    }
  }
  noLoop();
}


