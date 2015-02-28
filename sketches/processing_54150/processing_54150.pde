
final int MAX = 5;

int [] xList;
int [] yList;
int [] deltaXList;
int [] deltaYList;
int [] sizeList;

void setup ()
{
  size (400, 400);
  xList = new int [ MAX ];
  yList = new int [ MAX ];
  deltaXList = new int [ MAX ];
  deltaYList = new int [ MAX ];
  sizeList = new int [ MAX ];
  initArray (xList);
  initArray (yList);
  initArray (deltaXList);
  initArray (deltaYList);
  initArray (sizeList);
 
  drawFigures ();
  moveFigures ();
}

void moveFigures ()
{
  for (int i = 0; i < xList.length; i++)
  {
     xList[i] += deltaXList[i]; 
     yList[i] += deltaYList[i];
  }
}

void drawFigures()
{
  for (int i = 0; i < xList.length; i++)
  {
    rect (xList[i], yList[i], sizeList[i], sizeList[i]);
  }
}

void initArray ( int [] array)
{
  for (int i= 0; i < array.length; i++)
  {
    array[i] = int(random(width) );
  }
}
                
                
