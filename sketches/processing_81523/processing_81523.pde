
void setup ()
{
size(500,500);
background(255);
stroke(0);
noFill();
smooth();
}


void draw()
{  
for (int posX=5;posX < width;posX=posX+20)
{
  for (int posY=10;posY < height; posY=posY+20)
  {

  ellipse(posX,posY,400,4000);

  }
}
  noLoop();

} 



