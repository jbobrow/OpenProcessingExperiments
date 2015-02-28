
// Homework 11
// Hyunjook
// Hyunjoo Kim 2012 Copyrights

final int max = 50;

// list of arrays
int [] circleA;
int [] circleB;
int [] circleSize;
int [] speedA;
int [] speedB;
color [] circleColor;

void setup()
{
  size(800, 500); 
  smooth();
  noStroke();
  circleA = new int [max];
  circleB = new int [max];
  circleSize = new int [max];
  speedA = new int [max];
  speedB = new int [max];
  circleColor = new int [max];

  initColor();
  startArray(circleA, 0, width);
  startArray(circleB, 0, height);
  startArray(circleSize, 10, 300);
  startArray(speedA, 1, 7);
  startArray(speedB, 1, 7);
}

void draw()
{
  prepWindow();
  drawCircle();
  moveCircle();
}

void startArray(int [] anyArray, int low, int high)
{
  for (int i=0; i < anyArray.length; i++)
  {
    anyArray[i] = int(random(low,high));
  }
}

void prepWindow()
{
  fill(255);
  rect(0,0,width,height);
}

void drawCircle()
{
 for (int i=0; i < max; i++)
 {
   fill(circleColor[i],40);
   ellipse(circleA[i], circleB[i], circleSize[i], circleSize[i]);
 }
}

void initColor()
{
 for (int i = 0; i< circleColor.length; i++) 
  {
  circleColor[i] = color ((int)random(0, 255), (int)random(0, 255), (int)random(255));
  } 
}

void moveCircle()
{
  for (int i=0; i < max; i++)
  {
    circleA[i] = circleA[i] + speedA[i];
    if (circleA[i] + (circleSize[i]/2) > width)
    {
      speedA[i] = -speedA[i]; 
    }
    if (circleA[i] + (circleSize[i]/2) < -width)
    {
      speedA[i] = -speedA[i]; 
    }
    circleB[i] = circleB[i] + speedB[i];
    
    if (circleB[i] + (circleSize[i]/2) > height)
    {
      speedB[i] = -speedB[i]; 
    }
    if (circleB[i] + (circleSize[i]/2) < -height)
    {
      speedB[i] = -speedB[i]; 
    }
  }
}

