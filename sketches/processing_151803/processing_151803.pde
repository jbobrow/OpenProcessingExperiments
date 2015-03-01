

PVector p;

void setup ()
{
  size (600, 200);
  smooth();

  setRandomValue();
}

void draw ()
{
  background (#57385c);

  stroke (255);
  strokeWeight (3);

  drawValue();
}


void drawValue ()
{
  fill (#ffedbc);
  stroke (#A75265);
  strokeWeight (3);

  float x = p.x;
  float y = p.y;

  ellipse (x, y, 50, 50);
}

void setRandomValue ()
{
  float x = random (width);
  float y = random (height);

  p = new PVector (x, y);
}


void mousePressed ()
{
  setRandomValue ();
}

