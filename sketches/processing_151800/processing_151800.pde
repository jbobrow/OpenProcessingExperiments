
int num = 100;
float [] xpos = new float [num];
float [] ypos = new float [num];

void setup ()
{
  size (600, 200);
  smooth();

  setRandomValues();
}

void draw ()
{
  background (#57385c);

  fill (#ffedbc);
  stroke (#A75265);
  strokeWeight (3);

  drawValues();
}

void drawValues ()
{
  int i = 0;
  while (i < xpos.length)
  {
    float x = xpos [i];
    float y = ypos [i];

    ellipse (x, y, 20, 20);

    i = i +1;
  }
}

void setRandomValues ()
{
  int i = 0;
  while (i < xpos.length)
  {
    float x = random (width);
    float y = random (height);

    xpos [i] = x;
    ypos [i] = y;
    i = i +1;
  }
}


void mousePressed ()
{
  setRandomValues ();
}
