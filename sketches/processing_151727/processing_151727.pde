
int ars = 0;

void setup ()
{
  size (600, 200);
  smooth();
}

void draw ()
{
  background (#57385c);
  randomSeed (ars);

  drawEllipses (100);
  drawRects(50);
}

void drawEllipses (int num)
{
  fill (#ffedbc);
  stroke (#A75265);
  strokeWeight (3);

  int i = 0; 
  while (i < num)
  {
    float x = random (width);
    float y = random (height);

    float d = random (5, 30);

    circle (x, y, d);
    i = i +1;
  }
}

void drawRects (int num)
{
  fill (#ffedbc);
  stroke (#A75265);
  strokeWeight (3);

  int i = 0; 
  while (i < num)
  {
    float x = random (width);
    float y = random (height);

    float d = random (5, 30);

    square (x, y, d);
    i = i +1;
  }
}

void circle (float x, float y, float d)
{
  ellipse (x, y, d, d);
}

void square (float x, float y, float w)
{
  rect (x, y, w, w);
}

void mousePressed ()
{
  if (mouseButton == LEFT)
  {
    ars = ars +1;
  }
  else
  {
    ars = ars -1;
  }
}

