
// Keith O'Hara <kohara@bard.edu>
// March 8 Lecture

float x, y;

void setup()
{
  size(500, 500);
  smooth();
  x = width/2;
  y = 0;
  background(0);
  fill(96, 64);
}

void draw()
{ 
  x = x + 1;
  y = y + 1;
  
  x = constrain(x, 0, width);
  y = constrain(y, 0, height);
  
  ellipse(x, y, 50, 50);
}

