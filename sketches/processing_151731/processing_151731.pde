
void setup ()
{
  size (600, 200);
  smooth();
  background (#57385c);
  frameRate (5);
}

void draw ()
{
  // Background -------------------
  noStroke ();
  fill (#57385c, 10);
  rect (0, 0, width, height);

  // Calculation ------------------

  int num = 30;
  float rectWidth = float(width)/num;

  float x = rectWidth * iRandom (0, num);


  // draw rect ---------------------------------

  fill (#ffedbc);
  stroke (#A75265);
  strokeWeight (3);
  rect (x, 0, rectWidth, height);
}


int iRandom (float minVal, float maxVal)
{
  float rVal = random (minVal, maxVal);
  int iVal = int (rVal);
  return iVal;
}

void mousePressed ()
{
  background (#57385c);
}

