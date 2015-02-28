
void setup()
{
  size(800, 600);
  background (0);
}
 void draw ()
 
 {
   int yPosition = (int) random (600);
 int xPosition = (int) random (800);
 int cLength = (int)random (100);
 int cWidth = (int)random (100);
 int r = (int) random (0, 225);
 int g = (int) random (0, 225);
 int b = (int) random (0, 225);
 fill (r, g, b);
 ellipse (xPosition, yPosition, cLength, cLength);
 
 }
