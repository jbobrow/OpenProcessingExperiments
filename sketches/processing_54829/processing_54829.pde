
final int MAX = 50;

float [] boxX;
float [] boxY;
float [] deltaX;
float [] deltaY;
color [] col;

void setup ()
{
  size (400, 400);
  boxX = new float [MAX];
  boxY = new float [MAX];
  deltaX = new float [MAX];
  deltaY = new float [MAX];
  col = new color [MAX];
  
  initArray(boxX, 2, 18);
  initArray(boxY, 2, 18);
  initArray(deltaX, 1, 4);
  initArray(deltaY, 1, 4);
  initColorArray();
  
}

void draw ()
{
  prepScreen();
  drawBoxes();
  moveBoxes();
}

void prepScreen ()
{
  fill (126, 255, 217);
  noStroke ();
  rect (0, 0, width, height);
}

void initArray (float [] anyArray, float low, float high)
{
  for (int i = 0; i < anyArray.length; i++)
  {
   anyArray[i] = random(low, high); 
  }
}

void initColorArray ()
{
  for (int i = 0; i < col.length; i++)
  {
    col[i] = color (255, 255, 255, random(30));
  }
}

void drawBoxes ()
{
  for (int i = 0; i < boxX.length; i++)
  {
    fill (col[i]);
    rect (deltaX[i], deltaY[i], boxX[i], boxY[i]);
  }
}

void moveBoxes ()
{
 for (int i = 0; i < deltaX.length; i++)
 {
  boxX[i] += deltaX[i];
  if (boxX[i] > width)
  {
    boxX[i] = 0;
  }
  
  boxY[i] += deltaY[i];
  if (boxY[i] > height)
  {
    boxY[i] = 0;
  }
 } 
}
