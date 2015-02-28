
void setup () {
  size(500, 500);
  background(175,470, 582);
  smooth();
}
//décliner des traits sur une longueur
void draw()
{
  noFill();
  for (int posx = 5; posx<width; posx = posx+50)
  {
    for (int posY =5; posY<height; posY = posY+50)
    {
      strokeWeight(8);
      stroke(255);
      line(posx,posY,posx+45,posY+45);
      stroke(255);
    strokeWeight(5);
      line(posY,posx,posx+45,posY+45);
    }
  }
  noLoop();
}


