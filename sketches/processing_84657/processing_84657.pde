
//Créer une boucle de répétition "tant que"

void setup () {
  size(500, 500);
  background(#53E5B1);
  smooth();
}

void draw()
{

  noFill();

  for (int posX=25;posX< width;posX=posX+50)
  {
    for (int posY=25;posY< height;posY=posY+50)
    {
      fill(229,83,122);
      noStroke();
      ellipse(posX, posY, 40, 40);
      fill(#53E5B1);
      ellipse(posX, posY, 30, 30);
      line(posX,posY,posX+70,posY+90);
      fill(229,83,122);
      rect(posX,posY,posX+10,10);
    }
  }

  noLoop();
}



