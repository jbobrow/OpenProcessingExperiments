
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/150478*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
float r = 0;
float angle = 0;

void setup ()
{
  size (600, 200);
  smooth();

  background (#57385c);
}

void draw ()
{


  displayEllipse ();
  moveAngle ();
}

void moveAngle ()
{
  float angleSteps = PI / 90;

  angle = angle + angleSteps;
  r = r + angleSteps;
}

void displayEllipse ()
{
  fill (RGB, 249, 202, 184);
  stroke (RGB, 126, 196, 182);

  float x = width/2 + cos (angle)*r;
  float y = height/2 + sin (angle)*r;

  ellipse (x, y, 10, 10);
}

void mousePressed ()
{
  r = 0;
  angle = 0;
  background (#57385c);
}


