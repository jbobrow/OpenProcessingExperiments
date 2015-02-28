
//Michelle Guarino, mguarino@andrew.cmu.edu
//copyright. all rights reserved.

float a,b;

void setup ()
{
  size (600, 600);
  background (176,210,62);
  textSize(14);
   frameRate (40);

}
void draw ()
{
fill (random (200), random (200), random (200), random (100));
text (mouseX, mouseX, pmouseY);
}

