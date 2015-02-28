
void setup ()
{
size(500,500);
background(255);
stroke(0);
smooth();

}


void draw()
{  
for (int posX=5;posX < width;posX=posX+20)
{
  for (int posY=10;posY < height; posY=posY+20)
  {

stroke(#0B31B7);
  ellipse(posX+10,posY,30,30);
  stroke(#839AE8);
  ellipse(posX+10,posY,20,20);

  }
}
  noLoop();

} 



