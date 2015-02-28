
int[] x = {23, 46, 69, 92, 107, 127, 167, 187};
int[] y = {92, 69, 46, 23, 92, 69, 46, 23};

int[] x2 = new int[8];
int[] y2 = new int[8];

void setup()
{
  size(400, 400);
  colorMode(HSB, 360, 100, 100, 100);
  
  for (int i = 0; i < 8; i++)
  {
    x2[i] = int(random(1, 100));
    y2[i] = int(random(1, 100));
  }
}

void draw()
{
  // Create a gradient background
  for (int i = 0; i < 400; i++)
  {
    float percent = (float)i / 400;
    stroke(360 * percent, 100, 100, 100);
    line(0, i, 400, i);
  }
  
}

void shapeMaker(int xTrans, int yTrans, int degrees)
{
  pushMatrix();
  translate(xTrans, yTrans);
  rotate(radians(degrees));
  polygon(0, 0);
  popMatrix();
}
void polygon(int xShift, int yShift)
{
  noStroke();
  fill(0, 0, 30);
  beginShape();
  for (int i = 0; i < x.length; i++)
  {
    vertex(x[i] + xShift, y[i] + yShift);
  }
  endShape();
}


