
void setup () {
  size(500, 500);
  background(255);
  smooth();
}
//décliner des traits sur une longueur
void draw()
{
  noFill();
  for (int posx =0; posx<width; posx = posx+70)
  {
    for (int posY=0; posY<height; posY = posY+70)
    {
      //trait carré rouge
      strokeWeight(35);
      stroke(265,50,64);
      strokeCap(SQUARE);
      line(posx,posY,posx+50,posY+50);
      //trait rose foncé
      strokeWeight(15);
      stroke(118,20,11);
      line(posx,posY,posx-40,posY-40);
      //trait rose pale     
      strokeWeight(20);
      stroke(222,176,172);
      line(posx,posY-50,posx-50,posY);
      //trait
      strokeWeight(55);
      stroke(108,19,46,170);
      line(posx+40,posY+40,posx-10,posY-10);
      //trait fin blanc
      strokeWeight(3);
      stroke(255,150);
      line(posx,posY,posx-40,posY-40);
    }
  }
  noLoop();
}


