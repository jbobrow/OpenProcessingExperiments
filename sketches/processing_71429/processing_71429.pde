
//Kitty Kwan, mods 4/5, User Input- Evolution of Circles

/**
Evolution of circles. <br>
Run the program. Begin by pressing any key while moving the mouse.
Next, simultaneously hold down a key and left mouse button while moving the mouse.
Lastly, release the key.
To revert,  press a key while releasing the mouse.
Voila!
**/

int r=0;
int g=0;
int b=0;


void setup ()
{
  size (500, 500);
}
void draw ()
{

  if (mousePressed==true)
  {
    fill (255-r, g, b,20);
     rect (0,0,500,500);
    ellipse (mouseX, mouseY, mouseX, mouseY);
    ellipse (500-mouseX, 500-mouseY, mouseX, mouseY);
    r=r+5;
    if (r>250)
    {
      r=0;
      g=g+5;
    }
    b=b+5;
   
  }
  ellipse (random(5,500),5,20,20);
  ellipse (random(5,500),495,20,20);
  ellipse (5, random (5,500),20,20);
  ellipse (495, random (5,500),20,20);
}

void keyPressed ()
{
  if (keyPressed==true)
  {
    fill (255,0,0);
    rect (0,0,500,500);
    ellipse (500-mouseX, 500-mouseY, 30, 30);
  }
}
