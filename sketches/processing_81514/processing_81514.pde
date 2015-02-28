
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
for (int posX=25;posX < width;posX=posX+50)
{
  for (int posY=25;posY < height; posY=posY+30)
  {

  ellipse(posX,posY,50,50);
  ellipse(posX,posY,30,30);
  ellipse(posX,posY,10,10);
  }
}
  noLoop();

} 




