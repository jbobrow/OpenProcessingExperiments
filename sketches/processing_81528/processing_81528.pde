
void setup(){
  size(500,500);
  background(255);
}

void draw()
{
  for (int posX=5; posX < width; posX=posX+30)
  {
    for (int posY=5; posY < height; posY=posY+80)
{strokeCap(SQUARE);
strokeWeight(10);
stroke(#B96F9F,150);
line(400,posY,posX,310);

}
}
noLoop();
}


