
// A little challenge to draw something meaningful with one line only

void setup ()
{
  size (500,500);
  background (255);
}

void draw ()
{
  // draw a line with left mouseclick 
   if (mousePressed && mouseButton == LEFT)
  {
    line (pmouseX, pmouseY, mouseX, mouseY);
    }
    // erase with reight mouseclick
    if (keyPressed && key == 'e')
    {
      background (255);
    }
     }
     
void mouseReleased ()
{
  // immediately create image when mouse is released
  saveFrame ("line.jpg");
  background (255);
}
  
 
  
  






