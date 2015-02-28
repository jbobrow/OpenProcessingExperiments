
/* Drawing sketch, which uses mouse position to draw squares
in greyscale / background can be coloured in pastel colours 
with right click */

void setup ()
{
  size (500,500);
  colorMode (HSB, height);
  background (0, 0, 500);
  mouseX = 250;
  mouseY = 250;
}

void draw ()
{
   // round mouse position
        int x1 = round (mouseX / 50); 
        int posX1 = (x1*50);
        int y1 = round (mouseY / 50);
        int posY1 = (y1*50);
       noStroke (); 
       // colour max = height as reference to mouse position
       
       // to set darkest colour in middle of canvas, not one of the corners
       if (mouseY < height/2)
       {
         fill (0,0,height/2-mouseY, 25);
       }
       if (mouseY > height/2)
       {
       fill (0,0,mouseY-height/2, 25); 
       }
       // draw rectangles overlapping
       rect (posX1, posY1, 75, 75);
       // fill background
}

void mousePressed ()
{
  if (mousePressed && (mouseButton == LEFT))
  {
    background (0,0,500);
  }
}

void keyPressed ()
{
  if (keyPressed && (key == 'i'))
  {
    saveFrame ("grey_####.jpg");
  }
 }


