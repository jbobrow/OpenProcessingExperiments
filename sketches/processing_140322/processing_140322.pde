
float diameter;
float x, y;
float wd, ht;
float r;
float r2;
float r3;

void setup()
{
  size(400, 400);
  background(122, 83, 113);
  wd = 30;
  ht = 30;
}

void draw()
{
  diameter = .25*wd;
  fill(200, 152, 042);
  x = mouseX;
  y = mouseY;
  r = random(100);
  ellipse(x, y, r, r);
}

void mousePressed()
{
  r = random (255);
  r2 = random(255);
  r3 = random(255);
  background(r, r2, r3);
}


