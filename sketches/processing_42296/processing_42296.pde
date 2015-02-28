
lilppl[] l;
float  rd, gn, bl;
boolean c;

void setup()
{
  rd=random(0, 255);
  gn=random(0, 255);
  bl=random(0, 255);
  size(500, 500);
  smooth();
  noStroke();
  background(rd, gn, bl);
  l = new lilppl[10];
  for (int i=0; i<10; i++)
  {
    l[i] = new lilppl();
    l[i].x = mouseX;
    l[i].y = mouseY;
    l[i].d = 3;
    l[i].v = 5;
    l[i].b = 255;
    l[i].g = 0;
    l[i].r = 0;
  }
  background(rd, gn, bl);
  c=false;
}
void draw()
{
  for (int i=0; i<10; i++)
  {
    l[i].move();
    l[i].show();
  }
}
void keyPressed()
{
  if (key == 'c')c=true;
  if (c)
  {
    rd=random(0, 255);
    gn=random(0, 255);
    bl=random(0, 255);
    background(rd, gn, bl);
  }
}
void keyReleased()
{
  if (key == 'c')c=false;
}
class lilppl
{
  float x, y;
  int d, v, g, b, r;
  void show()
  {
    fill(r, g, b);
    ellipse(x, y, d, d);
    if (x>500)x=0;
    if (x<0)x=500;
    if (y>500)y=0;
    if (y<0)y=500;
  }


  void move()
  {
    x=x+random(-2, +2);
    y=y+random(-2, +2);
    x += ( mouseX - width/2  ) * 0.01 * v;
    y += ( mouseY - height/2 ) * 0.01 * v;
  }
}


