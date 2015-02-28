
//copyright Irene Joung 2014
//homework #8

final int MAX = 50;

float [ ] xVals;
float [ ] yVals;
float [ ] dimVals;
float [ ] deltaVals;

color [ ] colorVals;

void setup()
{
  size(600,400);
  noStroke();
  rectMode(CENTER);
  frameRate(15);
  smooth();

  xVals = new float[ MAX ];
  initFloatArray(xVals, 50, width-50);

  yVals = new float[ MAX ];
  initFloatArray(yVals, 50, height-50);

  dimVals = new float[ MAX ];
  initFloatArray(dimVals, 5, 30);

  deltaVals = new float[ MAX ];
  initFloatArray(deltaVals, 1, 20);

  colorVals = new color[ MAX ];
  initColorArray(colorVals);
}

void initFloatArray(float [ ] anyFloatArray, int minVal, int maxVal)
{
  for (int i = 0; i < anyFloatArray.length; i++)
  {
    anyFloatArray[i] = int(random(minVal, maxVal));
  }
}

void initColorArray(color [ ] anyColorArray)
{
  for (color i = 0; i < anyColorArray.length; i++)
  {
    anyColorArray[i] = color(random(255), random(255), random(255));
  }
}

void draw()
{
  background(0);
  moveFigures();
  drawFigures();
}

void moveFigures()
{
  for (int i = 0; i < dimVals.length; i++)
  {
    xVals[i] += deltaVals[i];
    if (xVals[i] + deltaVals[i] > width || xVals[i] < 0)
    {
      deltaVals[i] = -deltaVals[i];
    }

    yVals[i] += dimVals[i];
    if (yVals[i] + dimVals[i] > height || yVals[i] < 0)
    {
      dimVals[i] = -dimVals[i];
    }
  }
}

void drawFigures()
{
  for (int i = 0; i < xVals.length; i++)
  {
    fill(colorVals[i]);
      ellipse(xVals[i], yVals[i], dimVals[i], dimVals[i]);
      ellipse(xVals[i]-dimVals[i]*.5, yVals[i]-dimVals[i]*.5, dimVals[i]*-.5, dimVals[i]*-.5);
      ellipse(xVals[i]+dimVals[i]*.5, yVals[i]-dimVals[i]*.5, dimVals[i]*-.5, dimVals[i]*-.5);
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    setup();
  }
  else
  {
    exit();
  }
}



