
void setup(){
  size(500,500);
  background(255);
}

void draw()
{

  for (int posX=20; posX < width; posX=posX+80)
  {
    for (int posY=20; posY < height; posY=posY+80)
{strokeCap(SQUARE);
strokeWeight(10);
stroke(#B96F9F,150);
line(posX,posY-15,posX,posY+15);
stroke(#6FB9B3,150);
line(posX-15,posY,posX+15,posY);
}
}
noLoop();
}


