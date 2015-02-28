


final int MAX = 50;

float [ ] xPos;
float [ ] yPos;
float [ ] deltaY;
float [ ] deltaX;
float [ ] dia;
color [ ] col;

void setup()
{
  size (400,400);
  stroke(255,10);
  //smooth();

  xPos = new float [MAX];
  initializeArray(xPos, 0,width);
  yPos = new float [MAX];
  initializeArray(yPos, 0,0);
  deltaX = new float [MAX];
  initializeArray(deltaX, 1, 2);
  dia = new float [MAX];
  initializeArray(dia, 2,50);
  deltaY = new float [MAX];
  initializeArray(deltaY, 1, 2);
  col = new color [MAX];
  initializeColorArray();
}

void initializeArray(float [ ] arrayname, float lowval, float highval)
{
  for(int i = 0; i < arrayname.length; i++)
  {
    arrayname[i ] = random(lowval, highval);
  }
}

void initializeColorArray()
{
  for(int i = 0; i < col.length; i++)
  {
    col[i] = color(random(255), random(255), random(255), 100);
  }
}

void draw()
{
  backgrounder();
  drawFigure();
  moveFigure();
}

void backgrounder()
{
    fill(100,100);
    rect(0,0,width,height);
}

void drawFigure()
{
  for(int i = 0; i< MAX; i++)
  {
    fill(col[i]);
    rect(xPos[i], yPos[i], dia[i], dia[i]);
    line(0,0,xPos[i], yPos[i]);
    line(xPos[i], yPos[i], width, height);
    line(0,height,xPos[i], yPos[i]);
    line(xPos[i], yPos[i], width, 0);
  }
}

void moveFigure()
{
  for(int i = 0; i < MAX; i++)
  {
    yPos[i] = yPos[i] + deltaY[i];
    xPos[i] = xPos[i] + deltaX[i];

    if (yPos[i] > height || yPos[i] < 0 )
    {
      deltaY[i] = -deltaY[i];
    }
    if (xPos[i] > width || xPos[i] < 0 )
    {
      deltaX[i] = -deltaX[i];
    }
  }
}

