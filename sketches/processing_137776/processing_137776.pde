
//defines the hue of the stroke
int h = 0;
// alters the saturation when colour is introduced 
int s = 0;
// controls the distribution of points
int dx = 50;
int dy = 50;

void setup ()
{
size (500, 500);
 colorMode (HSB, 10);
 background (0,0,0);
 }

 void draw ()
 {
   // draw the dots evenly spaced 
    for (int X1 = dx; X1 <= width-dx; X1 = X1+dx)
   {
     for (int Y1 = dy; Y1 <= height-dy; Y1 = Y1+dy)
     {
       stroke (0, 0, 10);
       fill (0,0,10);
      ellipse (X1,Y1, 2, 2);
      }
   // draw the line when mousepressed  
   if (mousePressed && (mouseButton == LEFT))
   {
     // round mouse position to nearest dot
  int X2 = round (mouseX / dx);
  int X3 = (X2*dx);
  int Y2 = round (mouseY / dy);
  int Y3 = (Y2*dy);
   int X4 = round (pmouseX / dx);
  int X5 = (X4*dx);
  int Y4 = round (pmouseY / dy);
  int Y5 = (Y4*dy);
  // little trick to make sure saturation goes up when colour
  // not white
  if (h == 0)
  {
    s = 0;
  }
  else
  {
    s=10;
  }
  // draw line 
  stroke (h,s,10);
  strokeWeight (2);
  line (X3, Y3, X5, Y5);
  // change hue of the line 
  if (keyPressed && (key == 'h'))
  {
    h++;
    if (h == 10)
    {
      h = 0;
    }
  }
  }
  }
 }
 
void keyPressed ()
{
  
  // take screenshot
   if (keyPressed && (key == 'i'))
  {
    saveFrame ("dot_####.jpg");
  }
  // erase 
  if (keyPressed && (key == 'e'))
  {
    background (0,0,0);
  }
}
  
 
   
   


