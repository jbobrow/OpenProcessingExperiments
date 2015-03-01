
void setup ()
{
  size (600, 600);
  smooth();
}

void draw ()
{
  background (#A75265);

  float angleSteps = PI / 60;
  float angle = 0; // Zählvariable

  fill (#57385c);
  noStroke();

  ellipse (width/2, height/2, 500, 500);

  fill (#ffedbc, 40);

  while (angle < TWO_PI)
  {
    float x = width/2 + cos (angle) * 200;
    float y = height/2 + sin (angle) * 200;

    if (y < height*3/4)
    {
      ellipse (x, y, 80, 80);
    }
    angle = angle + angleSteps;
  }
}

