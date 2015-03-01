
void setup ()
{
  size (600, 200);
  smooth();
  noLoop();
}

void draw ()
{
  background (#57385c);

  drawEllipses ();
  drawRects();
}

void drawEllipses ()
{
  fill (#ffedbc);
  stroke (#A75265);
  strokeWeight (3);

  int i = 0; 
  while (i < 200)
  {
    float x = random (width);
    float y = random (height);

    float d = random (5, 30);

    ellipse (x, y, d, d);
    i = i +1;
  }
}

void drawRects ()
{
  fill (#ffedbc);
  stroke (#A75265);
  strokeWeight (3);

  int i = 0; 
  while (i < 200)
  {
    float x = random (width);
    float y = random (height);

    float d = random (5, 30);

    rect (x, y, d, d);
    i = i +1;
  }
}

void mousePressed ()
{
  redraw();
}

