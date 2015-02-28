
void setup(){
  size(500,500);
  background(255);
}

void draw()
{
  for (int posX=5; posX < width; posX=posX+30)
  {
    for (int posY=5; posY < height; posY=posY+30)
{strokeCap(SQUARE);
strokeWeight(40);
stroke(#B96F9F,150);
line(posX,posY,posX+10,posY+10);
stroke(#6FB9B3,150);
line(posX+10,posY+10,posX+20,posY+20);
}
}
noLoop();
}


