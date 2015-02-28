
Bubble[] b;
boolean aPressed, zPressed;

void setup()
{
  size(470, 470);
  smooth();
  stroke(240);
  fill(255, 230);
  aPressed = zPressed = false;

  b = new Bubble[50];
  for (int i=0; i<50; i++)
  {
    b[i] = new Bubble();
    b[i].x = random(0, 470);
    b[i].y = random(0, 470);
    b[i].d = 10;
    b[i].v = 5;
    b[i].c = #7E2121;
    b[i].s = 1;
  }
}

void draw()
{

  background(135, 206, 250);
  for (int i=0; i<b.length; i++)
  {
    b[i].move();
    b[i].show();
    if (aPressed) b[i].s = -1;
    if (zPressed) b[i].s = 1;
  }
}

void keyPressed()
{
  if (key == 'a') aPressed = true;
  if (key == 'z') zPressed = true;
}

void keyReleased()
{
  if (key == 'a') aPressed = false;
  if (key == 'z') zPressed = false;
}

class Bubble
{

  float x, y;
  int d, v, c, s, z;

  void show()
  {
    fill(c);
    rect(x, y, d, d);
  }

  void move()
  {
    x = x+v*s;
    y = y+v+random(-1,1);
    if (x <0)
    {
      x = 470;
       //s =-1;
    }
    if (x >470)
    {
      x = 0;
      //s =-1;
    }
    if (y <0) {
      y = 470;
    }
    if (y > 470) {
      y = 0;
    }
  }
}


