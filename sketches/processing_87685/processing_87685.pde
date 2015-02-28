
/*
Pearlyn Lii
 ID 3 - Spring 2013
 1/31/13
 */

//setup -----

size(800, 800);
background(0);
smooth();
colorMode(HSB, 360, 100, 100);

//draw -----

for (int i = 0; i<width; i+=3)
{
  fill(random(0, 90));
  stroke(0, 0, 100);
  strokeWeight(.5);
  ellipse(i, 100, i/2, i);
  rotate(random(1, 10));
}



