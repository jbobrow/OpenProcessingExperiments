
float inRadius = 4;
float outRadius = 10;
int numPoints = 6;
int angle = 0;

void setup()
{
  size(600, 600);
}

void draw()
{
  fill(255, 255, 255, 10);
  stroke(0, 0, 0);

  if (mousePressed)
  {
    translate(mouseX, mouseY);
    rotate(radians(angle));
    star(0, 0, numPoints, inRadius, outRadius);
    inRadius += 0.4;
    outRadius += 1;
    angle += 10;
  }
}

void star(float xCenter, float yCenter, int pointCount, float innerRadius, float outerRadius)
{
  pushMatrix();
  translate(xCenter, yCenter);
  float theta = 0.0;
  int vertCount = 2 * pointCount;
  float thetaRot = TWO_PI/vertCount;
  float tempRadius = 0.0;
  float x = 0.0;
  float y = 0.0;

  beginShape();
  for (int i=0; i < pointCount; i++)
  {
    for (int j=0; j < 2; j++)
    {
      tempRadius = innerRadius;

      // check if j is even
      if (j % 2 == 0)
      {
        tempRadius = outerRadius;
      }

      x = cos(theta) * tempRadius;
      y = sin(theta) * tempRadius;
      vertex(x, y);
      theta = theta + thetaRot;
    }
  }
  endShape(CLOSE);
  popMatrix();
}

