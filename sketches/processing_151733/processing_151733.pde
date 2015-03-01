
void setup ()
{
  size (600, 200);
  smooth();
  background (#57385c);
  frameRate (5);
}

void draw ()
{

  float x = random (width);
  float y = random (height);
  float d = random (20, 100);
  recursiveEllipse (x, y, d);
}


void recursiveEllipse (float x, float y, float d)
{
  fill (#ffedbc);
  stroke (#A75265);
  strokeWeight (1);

  ellipse ( x, y, d, d);

  d = d -6;

  if (d > 1)
  {
    recursiveEllipse (x, y, d);
  }
}

void mousePressed ()
{
  background (#57385c);
}

