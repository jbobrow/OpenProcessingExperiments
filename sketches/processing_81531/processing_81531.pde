
void setup(){
  size(500,500);
  background(255);
}

void draw()
{
  
  for (int posX=20; posX < width; posX=posX+60)
  {
    for (int posY=20; posY < height; posY=posY+60)
{strokeCap(SQUARE);
strokeWeight(30);
stroke(#B96F9F,150);
line(posX,posY-20,posX,posY+20);
stroke(#6FB9B3,150);
line(posX-20,posY,posX+20,posY);
}
}
noLoop();
}


