
void setup ()
{
size(500,500);
background(0);
stroke(255);
noFill();
smooth();
}


void draw()
{  
for (int posX=5;posX < width;posX=posX+20)
{
  for (int posY=5;posY < height; posY=posY+20)
  {

  line(posX,posY,posX+15,posY-15);
  }
}
  noLoop();

} 



