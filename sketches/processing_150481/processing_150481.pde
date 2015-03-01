
float r = 0;
float angle = 0;
float rSteps;
float maxR;
float angleSteps;
float ellipseSize;

float centerX;
float centerY;

void setup ()
{
  size (600, 200);
  smooth();

  setRandomValues ();

  background (#57385c);
}

void draw ()
{

  int i = 0;
  while ( i < 5)
  {
    displayEllipse ();
    moveAngle ();
    checkEdges ();
    i++;
  }
}

void checkEdges ()
{
  if (r >= maxR)
  {
    r = 0;
    angle = 0;
    setRandomValues ();
  }
}

void setRandomValues ()
{
  rSteps = random (0.5, 4);
  maxR = random (50, 300);
  angleSteps = random (PI / 100, PI /10);
  ellipseSize = random (5, 20);

  centerX = random (width);
  centerY = random (height);
}

void moveAngle ()
{

  angle = angle + angleSteps;
  r = r + angleSteps*rSteps;
}

void displayEllipse ()
{
  float colorValue = map (r, 0, maxR, 0, 1);
  color c = lerpColor (#ffedbc, #57385c, colorValue);

  fill (c);
  stroke (#A75265);

  float x = centerX + cos (angle)*r;
  float y = centerY + sin (angle)*r;

  ellipse (x, y, ellipseSize, ellipseSize);
}

void mousePressed ()
{
  r = 0;
  angle = 0;
  setRandomValues ();

  background (#57385c);
}

