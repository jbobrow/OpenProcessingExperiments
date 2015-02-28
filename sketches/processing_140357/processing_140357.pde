
//copyright Yoon-ji Kim 2014
//51-257 A
//HW 8
//refer to ICE12, Demo 3 under cc11, inspiration, cc14 class 2

final int MAX_FIGS = 100;

float [] xVals;
float [] yVals;
float [] dimVals;
float [] deltaDimVals;
color [] colorVals;

void setup()
{
  size(600, 400);
  noStroke();
  frameRate(23);
  rectMode(CENTER);
  smooth();
  
  xVals = new float[ MAX_FIGS ];
  initFloatArray(xVals, 5, width);
  
  yVals = new float[ MAX_FIGS ];
  initFloatArray(yVals, 5, height);
  
  dimVals = new float[ MAX_FIGS ];
  initFloatArray(dimVals, 5, 25);
  
  deltaDimVals = new float[ MAX_FIGS ];
  initFloatArray(deltaDimVals, 1, 15);
  
  colorVals = new color[ MAX_FIGS ];
  initColorArray(colorVals);
}

void initFloatArray(float[]anyFloatArray, int minVal, int maxVal)
{
  for(int i = 0; i < anyFloatArray.length; i++)
  {
    anyFloatArray[i] = int(random(minVal, maxVal));  
  }
}

void initColorArray(color[]anyColorArray)
{
  for(int i = 0; i < anyColorArray.length; i++)
  {
    anyColorArray[i] = color(random(255), random(255), random(255));
  }
}

void draw()
{
  background(0);
  drawFigs();
  moveFigs();
}

void moveFigs()
{
  for(int i = 0; i < dimVals.length; i++)
  {
    xVals[i] += dimVals[i];
    if(xVals[i] + dimVals[i] > width || xVals[i] < 0)
    {
      dimVals[i] = -dimVals[i];
    }
    
    yVals[i] += deltaDimVals[i];
    if(yVals[i] + deltaDimVals[i] > height || yVals[i] < 0)
    {
      deltaDimVals[i] = -deltaDimVals[i];
    }
  }
}

void drawFigs()
{
  for(int i = 0; i < xVals.length; i++)
  {
   fill(colorVals[i]);
   triangle(xVals[i], yVals[i], xVals[i]+dimVals[i], yVals[i], 1.5*xVals[i], yVals[i]+dimVals[i]);
  }
}

void keyPressed()
{
  if(key == ' ')
  {
    setup();
  }
  else
  {
    exit();
  }
}



