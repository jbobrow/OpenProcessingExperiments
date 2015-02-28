
// Homework 3
// Josh Newby jnewby@andrew.cmu.edu Copyright 2013 Pittsburgh PA

//variables
float x, y, wd, ht, easingcoef;

//function definitions
void setup( )
{
size(500, 500);
x = width * .5;
y = height * .5;
wd = width * .2;
ht = height * .2;
easingcoef = .1;
background(0);
}

void draw( )
{
   fill(random(255), random(255), random(255),  5);
   noStroke();
   ellipse(mouseX , mouseY, wd, ht);
   wd = wd + 1;
   ht = ht + 1;
   float distx = mouseX - x;
   float disty = mouseY - y;
   if (keyPressed) saveFrame( "####.jpg");
  if (wd > width)
  {
    wd = width * .1;
    background(0);
  }
  if(ht > height)
  {
    ht = height * .1;
  }
}
