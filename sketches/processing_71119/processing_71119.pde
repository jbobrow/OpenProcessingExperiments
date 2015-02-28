
//Gregory Taxerman, User Input, CP1 16-17

int x = 250;
int y = 400;
int c = 10;
int d = 10;
int e = 10;
int f = 10;
int g = 10;
void setup ()
{
  size(500, 500);
}

void draw ()
{
  fill(255, 0, 0, 40);
  rect(0, 0, 500, 500);
  fill(255);
  ellipse(x, y, 50, 50);
  fill(0);
  keyPressed ();  
  fallone ();
  falltwo ();
  fallthree ();
  fallfour ();
  fallfive ();
}


void keyPressed ()
{
  if (key=='a')
  {

    x = x - 4;
  }

  if (key=='d')
  {
    x = x + 4;
  }
  if (key=='w')
  {
    y = y - 4;
  }
  if (key=='s')
  {
    y = y + 4;
  }
}


void fallone ()
{
  ellipse(30, d, 30, 30);
  d = d + 3;
  if (d > 500)
  {
    d = 0;
  }
}

void falltwo ()
{
  ellipse(125, c, 30, 30);
  c = c + 5;
  if (c > 500)
  {
    c = 0;
  }
}

void fallthree ()
{
  ellipse(215, e, 30, 30);
  e = e + 6;
  if ( e > 500)
  {
    e = 0;
  }
}

void fallfour ()
{
  ellipse(310, f, 30, 30);
  f = f + 2;
  if (f > 500)
  {
    f = 0;
  }
}

void fallfive ()
{
  ellipse(425, g, 30, 30);
  g = g + 5;
  if (g > 500)
  {
    g = 2;
  }
}
