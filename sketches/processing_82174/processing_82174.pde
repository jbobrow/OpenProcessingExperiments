
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
color[] dotColor2;

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
  dotColor2 = new int [MAX];

  posX = initIntArray(0, width);
  posY = initIntArray(0, height);
  posZ = initIntArray(900, 500);
  wd = initIntArray(1, 30);
  speedX = initIntArray(-3, 9);
  speedY = initIntArray(-3, 9);
  speedZ = initIntArray(-3, 5);
  dotColor = initColorArray();
  dotColor2 = initColorArray2();
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

    if (posX[i] > width)
    {
      posX[i] = 0;
    }
    if (posY[i] > height)
    {
      posY[i] = 0;
    }
    if (posZ[i] > 1000)
    {
      posZ[i] = -1000;
    }
    if (posX[i] < 0)
    {
      posX[i] = width;
    }
    if (posY[i] < 0)
    {
      posY[i] = height;
    }
    if (posZ[i] < -1000)
    {
      posZ[i] = 1000;
    }

    if (keyPressed == true && keyCode == UP)
    {
      //speedX[i]++;
      speedY[i]--;
      speedZ[i]--;
    }
    if (keyPressed == true && keyCode == DOWN)
    {
      //speedX[i]--;
      speedY[i]++;
      speedZ[i]++;
    }
    if (keyPressed == true && keyCode == LEFT)
    {
      speedX[i]--;
      //speedY[i]++;
      speedZ[i]--;
    }
    if (keyPressed == true && keyCode == RIGHT)
    {
      speedX[i]++;
      //speedY[i]--;
      speedZ[i]++;
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
    ellipse(15, 15, wd[i]*2, wd[i]*2);
    fill(dotColor2[i]);
    rect(5, 5, wd[i]/2, wd[i]/2);


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

color[] initColorArray2()
{
  color[] temp = {
  };
  for (int i = 0; i<MAX; i++)
  {
    temp = append(temp, color(random(255), random(255), random(255)));
  }
  return temp;
}

void mousePressed()
{
  dotColor = initColorArray();
  dotColor2 = initColorArray2();
}


