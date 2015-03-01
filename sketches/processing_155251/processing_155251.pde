
PVector [] start;
PVector [] end;

int xRes = 20;
int yRes = 10;
float rectWidth;
float rectHeight;

float m = 0;

void setup() {
  size(600, 200);
  smooth();

  rectWidth = float(width)/xRes;
  rectHeight = float(height)/yRes;

  start = new PVector [50];
  end = new PVector [50];

  setRandomPositions (start);
  setRandomPositions (end);

  frameRate (30);
}

void setRandomPositions (PVector [] p)
{
  int i = 0;
  while (i < p.length)
  {
    PVector pos = new PVector (rectWidth * iRandom (1, xRes), rectHeight * iRandom (1, yRes));
    p [i] = pos;
    i = i +1;
  }
}


void draw()
{
  fill (#57385c, 80);
  noStroke();
  rect (0, 0, width, height);

  // grid

  stroke (#ffedbc, 20);
  noFill();
  for (int i = 0; i < xRes; i++)
  {
    for (int j = 0; j < yRes; j++)
    {
      float x = i * rectWidth;
      float y = j * rectHeight;

      rect (x, y, rectWidth, rectHeight);
    }
  }

  // ellipse


  fill (#ffffff);
  noStroke();

  int i = 0;
  while (i < start.length)
  {

    PVector current = new PVector (lerp (start[i].x, end[i].x, sin (m)), lerp (start[i].y, end[i].y, sin (m)));



    ellipse (current.x, current.y, 6, 6);
    i = i+1;
  }

  // move

  m+= 0.02;

  // check if target reached & set new position

  if (m >= PI/2)
  {
    m = 0;
    arrayCopy (end, start);
    setRandomPositions (end);
  }
}

int iRandom (float minVal, float maxVal)
{
  float rVal = random (minVal, maxVal);
  int iVal = int (rVal);
  return iVal;
}

