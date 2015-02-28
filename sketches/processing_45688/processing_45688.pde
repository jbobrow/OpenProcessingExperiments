
int MAX = 120;

float [] x;
float [] y;
float [] wd;
float [] ht;
float [] dx;
float [] dy;
color [] col;

void setup ()
{
  size(400, 400);
  x = new float [MAX];
  initializeFloatArray(x, 50, width-50);
  y = new float [MAX];
  initializeFloatArray(y, 50, height-50);
  wd = new float [MAX];
  initializeFloatArray(wd, 0, 10);
  ht = new float [MAX];
  initializeFloatArray(ht, 0, 10);
  dx = new float [MAX];
  initializeFloatArray(dx, -15, 15);
  dy = new float [MAX];
  initializeFloatArray(dy, -15, 15);
  col = new color [MAX];
  initializeColorArray();
 
}

void draw()
{
  prepScreen();
  drawThings();
  moveThings();
}

void initializeFloatArray(float [] array, float low, float high)
{
  for (int i = 0; i < MAX; i++)
  {
    array[i] = random(low, high);
  }
}

void prepScreen()
{
  noStroke();
  fill(255, 10);
  rect(0, 0, width, height);
}

void drawThings()
{
  for (int i = 0; i < MAX; i++)
  {
    fill(col[i]);
    ellipse(x[i], y[i], wd[i], ht[i]);
  }
}

void moveThings()
{
  for (int i = 0; i < MAX; i++)
{
  x[i] = x[i] + dx[i];
  y[i] = y[i] + dy[i];
  
  if (x[i] < 0)
{
  dx[i] = -dx[i];
}

if (x[i] > width)
{
  dx[i] = -dx[i];
}

if (y[i] < 0)
{
  dy[i] = -dy[i];
}

if (y[i] > height)
{
  dy[i] = -dy[i];
}
}



}

void initializeColorArray()
{
  for (int i = 0; i < MAX; i++)
  {
    int r = int(random(256));
    int g = int(random(256));
    int b = int(random(256));
    col[i] = color(r, g, b);
  }
}
