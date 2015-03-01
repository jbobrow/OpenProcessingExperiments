
Circle circles[][] = new Circle[6][10];
Rectangle rectangles[] = new Rectangle[24];
int xspacing = 25;
int yspacing = 25;
int xRectSpacing;
int xRectAdd;
int timeStart = 1;
int rectTimeStart = 1;
int s;
int m;
int h;

void setup()
{
  size(500, 300);
  background(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
  xRectSpacing = width/24;
  xRectAdd = width/24;
  for (int a = 0; a < rectangles.length; a++)
  {
    rectangles[a] = new Rectangle(xRectSpacing, height/2, rectTimeStart);
    xRectSpacing = xRectSpacing + xRectAdd;
    rectTimeStart = rectTimeStart + 1;
  }
  for (int i = 0; i < 6; i++)
  {
    xspacing = 25;
    for (int j = 0; j < 10; j++)
    {
      //circles[i][j] = new Circle(xspacing, yspacing, timeStart, timeStart, timeStart);
      circles[i][j] = new Circle(xspacing, yspacing, timeStart, timeStart);
      xspacing = xspacing + 50;
      timeStart = timeStart + 1;
    }
    yspacing = yspacing + 50;
  }
}

void draw()
{
  background(255);
  //s = second();
  //m = minute();
  //h = hour();
  s = s+1;
  if (s == 60)
  {
    s = 0;
    m = m +1;
  }
  if (m == 60)
  {
    m = 0;
    h = h +1;
  }

  if ( h == 24)
  {
    h = 0;
  }

  for (int p = 0; p < rectangles.length; p++)
  {
    rectangles[p].show();
  }

  for (int i = 0; i < 6; i++)
  {
    for (int j = 0; j< 10; j++)
    {
      circles[i][j].display();
    }
  }

  for (int a = 0; a < 6; a++)
  {
    for (int b = 0; b < 10; b++)
    {
      circles[a][b].grow();
    }
  }
  if (s == 0)
  {
    for (int c = 0; c < 6; c++)
    {
      for (int d = 0; d < 10; d++)
      {
        circles[c][d].reset();
      }
    }
  }
  if (m == 0)
  {
    for (int c = 0; c < 6; c++)
    {
      for (int d = 0; d < 10; d++)
      {
        circles[c][d].reset2();
      }
    }
  }


  println(h, m, s);
}

class Circle
{

  int x;
  int y;
  int r = 10;
  int r2 = 5;

  int timeCheck;
  int timeCheck2;
  color c = color(random(0,255),random(0,255),random(0,255));
  color c3 = color(random(0,255),random(0,255),random(0,255));



  Circle(int tempx, int tempy, int temptimeCheck, int temptimeCheck2)
  {
    x = tempx;
    y = tempy; 
    timeCheck = temptimeCheck;
    timeCheck2 = temptimeCheck2;
  }

  void display()
  {
    noStroke();
    fill(c3);
    ellipse(x, y, r*2, r*2);
    fill(c);
    ellipse(x, y, r2*2, r2*2);
  }

  void grow()
  {
    if (timeCheck <= s)
    {

      if (r < 25)
      {
        r = r + 1;
      }
    }
    if (timeCheck2 <= m)
    {

      if (r2 < 18)
      {
        r2 = r2+1;
      }
    }
  }
  void reset()
  {
    r = 10;
   c3 = color(random(0,255),random(0,255),random(0,255));
  }

  void reset2()
  {
    r2 = 5;
    c = color(random(0,255),random(0,255),random(0,255));
  }
}

class Rectangle
{
  int x;
  int y;
  int w = width/24;
  int he = height;
  int recttimeCheck;
  color c = color(random(0, 255), random(0, 255), random(0, 255));

  Rectangle(int tempx, int tempy, int temprecttimeCheck)
  {
    x = tempx;
    y = tempy;
    recttimeCheck = temprecttimeCheck;
  }

  void show()
  {
    if (recttimeCheck <= h)
    {
      stroke(1);
      fill(c);
      rect(x, y, w, he);
    }
  }
}



