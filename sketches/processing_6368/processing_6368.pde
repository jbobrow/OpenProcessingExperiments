
Bubble[] b;

void setup()
{
  size(600,600);
  smooth();
  stroke(240);
  fill(255);
  frameRate(5000);

  b = new Bubble[1500];
  for(int i=0; i<b.length; i++)
  {
    b[i] = new Bubble();
    b[i].x = random(width);
    b[i].y = random(height);
    b[i].d = (int)random(-1,2);
    b[i].v = (int)random(1,10);
  }
}

void draw()
{
  background(0);
  for(int i=0; i<b.length; i++)
  {
    b[i].move();
    b[i].show();
  }
}

class Bubble
{
  float x, y;
  int d, v;

  void show()
  {
    ellipse(x,y, d,d);
  }

  void move()
  {
    x += ( mouseX - width/2  ) * 0.01 * v;
    y += ( mouseY - height/2 ) * 0.01 * v;
  }
}


