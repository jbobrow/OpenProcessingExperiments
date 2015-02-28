
float x;
float y;
float d;

void setup ()
{
  size (600, 200); 
  smooth();
  background (#57385c);
  
  x = 0;
  y = random (0, height);
  d = random (20, 40);
}

void draw ()
{
  stroke (#A75265);
  strokeWeight (1);
  fill (#ffedbc);
  ellipse (x, y, d, d);
  
  x+= random (1, 10);
  d = random (20, 40);
  
  if (x > width+15)
  {
    x = 0;
    y = random (0, height);
  }
  
}


void mousePressed ()
{
  background (#57385c);
}



