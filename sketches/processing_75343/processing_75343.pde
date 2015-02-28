
//HW 11 - Computing for the Arts with Processing
//Copyright 2012 Tony Zhang

final int MAX = 100;

int[] posX;
int[] posY;
int[] posZ;
int[] wd;
int[] speedX;
int[] speedY;
int[] speedZ;
color[] dotColor;

void setup()
{
  //size (screen.width, screen.height, P3D); 
  size(800, 800, P3D);
  posX = new int [MAX];
  posY = new int [MAX];
  posZ = new int [MAX];
  wd = new int [MAX];
  speedX = new int [MAX];
  speedY = new int [MAX];
  speedZ = new int [MAX];
  dotColor = new int [MAX];

  posX = initIntArray(0, width);
  posY = initIntArray(0, height);
  posZ = initIntArray(1000, -1000);
  wd = initIntArray(1, 30);
  speedX = initIntArray(1, 2);
  speedY = initIntArray(1, 2);
  speedZ = initIntArray(5, 9);
  dotColor = initColorArray();
}

void draw()
{
  prepBack();
  drawDots();
  scatterDots();
}

void scatterDots()
{
  for (int i=0; i<posX.length; i++)
  {
    posX[i] += speedX[i];
    posY[i] += speedY[i];
    posZ[i] += speedZ[i];

    if (posX[i] > width || posX[i] < 0)
    {
      speedX[i] = -speedX[i];
    }
    if (posY[i] > height || posY[i] < 0)
    {
      speedY[i] = -speedY[i];
    }
    if (posZ[i] > 1000 || posZ[i] < -1000)
    {
      speedZ[i] = -speedZ[i];
    }
  }
}
void drawDots()
{
  for (int i=0; i<posX.length; i++)
  {
    pushMatrix();
    noStroke();
    fill(dotColor[i]);
    translate(posX[i], posY[i], posZ[i]);
    ellipse(0, 0, wd[i], wd[i]);
    popMatrix();
  }
}

void prepBack()
{
  background(255);
  //fill(255,10);
  //rect(0, 0, width, height);
}

int[] initIntArray(int low, int high)
{
  int[] temp = {
  };
  for (int i = 0; i<MAX; i++)
  {
    temp = append(temp, int(random(low, high)));
  }
  return temp;
}

color[] initColorArray()
{
  color[] temp = {
  };
  for (int i = 0; i<MAX; i++)
  {
    temp = append(temp, color(random(255), random(255), random(255)));
  }
  return temp;
}


