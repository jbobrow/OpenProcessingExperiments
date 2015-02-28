
//Créer une boucle de répétition "tant que"

void setup () {
  size(500, 500);
  background(#A2A2A2);
  smooth();
}

void draw()
{

  noFill();

  for (int posX=25;posX< width;posX=posX+50)
  {
    for (int posY=25;posY< height;posY=posY+50)
    {
      fill(255);
      noStroke();
      ellipse(posX, posY, 10, 40);
      fill(#A9D1B5);
      ellipse(posX, posY, 30, 30);
      line(posX,posY,posX+70,posY+90);
      fill(229,83,122);
      
       stroke(255);
     strokeWeight(2);
       line(posX,posY,posX+10,posY+10);
       line(posX,posY,posX-40,posY-70);
       
         fill(#FCC9E7,180);
for (int posx=40; posx<= 450; posx= posx+40)
    for (int posy=40; posy<= 450; posy=posy+40)  
      rect(posx, posy, 10, 10);

      
    }
  }

  noLoop();
}



