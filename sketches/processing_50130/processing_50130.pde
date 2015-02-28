
// Homework #3 48-257
// Humaira Tasnim htasnim Copyright 2012

void setup()
{
  size (500, 500);
  smooth ();
  background (random(255), random(255), random(255));
  noStroke ();
}

void draw()
{
  if (mousePressed && (mouseButton == RIGHT))
 {
   background (random(255), random(255), random(255));
 }
}

void mouseClicked()
{
  if (mouseButton == LEFT)
  {
    fill (random(255), random(255), random(255), 100);
    ellipse(mouseX, mouseY, 100, 100);
  }
}

void mouseDragged()
{
    fill (random(256), random(256), random(256), 10);
    ellipse(mouseX, mouseY, 100, 100);
}

