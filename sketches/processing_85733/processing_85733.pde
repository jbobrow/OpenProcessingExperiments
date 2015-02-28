
void setup() {

  size(500, 500);
  background(138);
  smooth();
}

void draw()

{

  for (int posX=1; posX < width; posX = posX+30)


    for (int posY=1; posY < height; posY = posY+70)
    {
      rect(posX, posY, 70, 70);
      rect(posX, posY, 50, 50);
      
      fill(255,255,255,127);
      ellipse(posX,posY,40,60);
      ellipse(posX,posY,90,80);
    }



  noLoop();
}



