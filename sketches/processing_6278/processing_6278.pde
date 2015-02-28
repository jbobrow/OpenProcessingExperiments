
int clickX, clickY, releaseX, releaseY;
float x = 255, y = 255, z = 255;
void setup()
{
  size(600,600);
  smooth();
}

void draw()
{
  z = z - 20;
  y = y - 20;
  x = x - 20;
  fill(x,y,z);
  triangle(mouseX-20, mouseY+20, mouseX+20, mouseY-20, mouseX+20, mouseY+20);
  if (x<1)
 {
   x = 255;
   y = 255;
   z = 255;
 }
 if (mousePressed)
 {
   z = 0;
   y = 0;
 }

}


