
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/145567*@* */

void setup ()
{
  size (600, 200);
  smooth();
  frameRate (25);

  background (#57385c);
}

void draw ()
{

  stroke (#A75265);
  strokeWeight (2);
  fill (#ffedbc);
  ellipse (mouseX, mouseY, 50, 50);
}

void mousePressed ()
{
  background (#57385c);
}

