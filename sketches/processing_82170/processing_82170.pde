
void setup () {
  size(500, 500);
  background(175, 582);
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
      strokeWeight(10);
      stroke(255);
      line(posx,posY,posx+25,posY+25);
      //traits de l'autre sens
      stroke(255,150);
      line(posx,posY+25,posx+25,posY);
      stroke(0,100);
      line(posx+45,posY,posx,posY+45);
    }
  }
  noLoop();
}




