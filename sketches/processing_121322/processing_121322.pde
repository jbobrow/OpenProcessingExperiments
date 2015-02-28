
float e = 0;
float x;
float y;
float z;

void setup()
{
  size(500, 500);
}

void draw()
{
  background(180);
  noStroke();
  
  fill(75, 178, y);
  ellipse(200, 210, 380, 380);
  y = map(sin(e), -1, 1, 0, 90);
  
  fill(19, 116, z);
  ellipse(340, 430, 120, 120);
  z = map(sin(e), -1, 1, 0, 70);
  
  fill(124, 211, x); 
  ellipse(425, 75, 125, 125);
  x = map(sin(e), -1, 1, 90, 0);
  
  e += 0.05;
  println(e);
}
