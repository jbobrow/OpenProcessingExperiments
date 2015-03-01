
void setup ()
{
  size (500, 500);
  smooth();
}

void draw ()
{
  background (#A75265);

  drawEye(width/2, 200);
}

void drawEye (float cx, float cy)
{
  float eyeCenterX = cx;
  float eyeCenterY = cy;

  float eyeBall = 100;
  float iris = 50;

  pushMatrix();
  translate (eyeCenterX, eyeCenterY);

  noStroke();
  fill (247);
  ellipse (0, 0, eyeBall, eyeBall);

  popMatrix();
  pushMatrix();

  float irisX = eyeCenterX;
  float irisY = eyeCenterY;

  translate (irisX, irisY);

  fill (#57385c);
  ellipse (0, 0, iris, iris);

  popMatrix();
}

