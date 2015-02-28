
//By Alex Kong
hair[] b;

void setup()
{
  size(800,600);
  smooth();
  stroke(240);
  fill(255,230);
  frameRate(60);

  b = new hair[225];
  for(int i=0; i<225; i++)
  {
    b[i] = new hair();
    b[i].x = (int)random(-width,width);
    b[i].y = (int)random(-height,height);
    b[i].d = (int)random(10,90);
    b[i].v = (int)1;
     if (b[i].x == 800)
    {
      b[i].x = 0;
    }
    if (b[i].y == 600)
    {
      b[i].y = 0;
    }
    if (b[i].x == 0)
    {
      b[i].x = 800;
    }
    if (b[i].y == 0)
    {
      b[i].y = 800;
}
  }
}

void draw()
{
  for(int i=0; i<b.length; i++)
  {
    b[i].move();
    b[i].show();
  }
}

class hair
{
  float x, y;
  int d, v;

  void show()
  {
    noFill();
    rotate(100);
    stroke(random(255));
    rect(x,y, d,d);
    arc(x,y,d+600,d+600,0, PI/2);
    noFill();
    ellipse(x,y,d,d);
  }
  void move()
  {
    x -= (width/2 ) * 0.01259 * v;
    y -= (height/2 ) * 0.01259 * v;
    for (; y <0 ; y=y-1) {
    y=1000;
    }
    for (; x<0 ; x=x-1) {
    x=1000;
    }
  }
}

