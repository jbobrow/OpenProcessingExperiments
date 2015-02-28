
void setup () {
  //choisir la taille
  size(500, 500);
  //fond blanc
  background(255);
  //lisser
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
      //trait vert/bleu
      strokeWeight(20);
      stroke(25,460,164);
      line(posx,posY,posx+25,posY+25);
      //traits gris
      stroke(25,60,69,150);
      line(posx,posY+25,posx+25,posY);
      stroke(25,380,24);
      //trait vers "fluo"
      strokeWeight(5);
      color(0);
      line(posx,posY-25,posx-25,posY);
      //traits orange
      strokeWeight(7);
      stroke(398,89,56);
      line(posx+35,posY,posx,posY+35);
      //trait blanc transparent
      strokeWeight(5);
      stroke(255,150);
      line(posx,posY,posx-25,posY-25);
    }
  }
  noLoop();
}


