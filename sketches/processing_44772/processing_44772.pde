
//HW EC 3 - Computing for arts with Processing
//Copyright Ziad Ewais (zewais) - 11/2/2011 - CMU


final int MAX = 100;
float [ ] x;
float [ ] y;
float [ ] w;
float [ ] h;
float [ ] deltaX;
float [ ] deltaY;
color [ ] col;

void setup()
{
  size(900, 600);
  x = new float[MAX];
  y = new float[MAX];
  w = new float[MAX];
  h = new float[MAX];
  deltaX = new float[MAX];
  deltaY = new float[MAX];
  col = new color[MAX];
  
  initArray(x, 50, width - 50);
  initArray(y, 50, height - 50);
  initArray(w, 1, width * .1);
  initArray(h, 1, height * .1);
  initArray(deltaX, 1, 5);
  initArray(deltaY, 1, 5);
  initColorArray();
}

void draw()
{
  bg();
  drawRect();
  moveRect();
  checkPos();
}

void bg()
{
  
  fill(0,40);
  rect(0,0,width,height);
}

void initArray(float[] arr, float low, float high)
{
  for(int i = 0; i < arr.length; i++)
  {
    arr[i] = random(low, high);
  }
}

void initColorArray()
{
  for(int i = 0; i < MAX; i++)
  {
    col[i] = color(random(255), random(255), random(255));
  }
}

void drawRect()
{
  for(int i = 0; i < MAX; i++)
  {
    fill(col[i]);
    rect(x[i], y[i], w[i], h[i]);
  }
}

void moveRect()
{
  for(int i = 0; i < MAX; i++)
  {
    x[i] = x[i] + deltaX[i];
    y[i] = y[i] + deltaY[i];
  }
}

void checkPos()
{
  for(int i = 0; i < MAX; i++)
  {
    if(x[i] < 0 || x[i] + w[i] > width)
    {
      deltaX[i] = -deltaX[i];
    }
    else if(y[i] < 0 || y[i] + h[i] > height)
    {
      deltaY[i] = -deltaY[i];
    }
  }
}

