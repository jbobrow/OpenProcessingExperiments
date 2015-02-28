
//melanie danver
//copyright 2012

final int MAX = 50;

float [] xList;
float [] yList;
float [] changeXList;
float [] changeYList;
float [] sizeList;
color [] colorList;

void setup()
{
  noStroke();
  size(400, 400);
  background(255);
  xList = new float[MAX];
  inArray(xList);
  yList = new float[MAX];
  inArray(yList);
  changeXList = new float[MAX];
  inArray(changeXList);
  changeYList = new float[MAX];
  inArray(changeYList);
  sizeList = new float[MAX];
  inArray(sizeList);
  colorList = new color [MAX];
  inColorArray();
}

void draw()
{
  background(255);
  create();
  bounce();
}

void bounce()
{
  for (int i = 0; i <xList.length; i++)
  {
    xList[i] += (changeXList[i]/10);
    if (xList[i] >= width+1)
    {
      changeXList[i] = - changeXList[i];
    }
    else if ( xList[i] <= 0)
    {
      changeXList[i] = -changeXList[i];
    }
    yList[i] += (changeYList[i]/10);

    if (yList[i] > height+1)
    {
      changeYList[i] = -changeYList[i];
    }
    else if ( yList[i] <= 0)
    { 
      changeYList[i] = -changeYList[i];
    }
  }
}
void create()
{
  for (int i = 0; i <xList.length; i++)
  {
    fill(colorList[i]);
    // fill(random(255),0,random(255),50);
    ellipse(xList[i], yList[i], sizeList[i], sizeList[i]);
  }
}

void inArray( float [] array)
{
  for (int i =0; i<array.length; i++) {
    array[i] = int(random(10, 100));
  }
}

void inColorArray()
{
  for (int i = 0; i<colorList.length; i++)
  {
    colorList[i] = color(random(255), 0, random(255), random(255-(MAX*2), 255));
  }
}


