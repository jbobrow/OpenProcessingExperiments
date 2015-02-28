
//Josh Newby jnewby@andrew.cmu.edu Copyright Josh Newby 2013 Pittsburgh PA
//Homework #4

//This program draws arrays of lines based on your mouse position and generates random color. It will clear your canvas if you click the mouse button.

 float x, y;

void setup()
{
  size (500, 500);
  smooth();
  background (0);
  x = 10;
  y = 10;
}

void draw()
{
  stroke(random(255), random(255), random(255));
  noFill();
  line(x, y, mouseX, mouseY);
  x = x + 1;
  y = y + 2;
  if (x > width)
 {
  x = x * .1; 
 }
  if (y > height)
 {
   y = y * .1;
 }
 if (mousePressed)
{
  background (0);
}
}
