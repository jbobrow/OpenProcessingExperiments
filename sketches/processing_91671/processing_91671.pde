
int r, g, b, o;
int[] anArray = {40, 75, 110, 145, 180};
int shapeSize;
int positionY;
void setup()
{
 size(220, 200);
 
 shapeSize = 10;
}

void draw()
{
 background(255);
 fill(0);
 rect(0, 0, 20, height);
 rect(0, height - 20, width, 20);
 rect(width - 20, 0, 20, height);
 if((mouseX > 0 && mouseX < 20) || (mouseX > width - 20 && mouseX < width) || (mouseY > height - 20 && mouseY < height))
 {
   r = (int)random(255);
   g = (int)random(255);
   b = (int)random(255);
   o = (int)random(255);
   shapeSize = (int) random(10,30);
   positionY = (int)random(20, 180);
 }
 drawShape(anArray);
}
 
 void drawShape(int[] anArray)
 {
  fill(r, g, b, o);
  for(int i = 0; i < anArray.length; i++)
  {
   ellipse(anArray[i], positionY, shapeSize, shapeSize);
  }
 }
