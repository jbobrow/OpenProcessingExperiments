
//Benson Ly, Repeating Shapes, CP 1 Mods 14-15
int x = 5;
int y = 0;
int z = 395;
int w = 5;
void setup()
{
  size(400, 400);
  background(0);
  noFill();
}
void draw()
{
  circle();
  things();
}
void things()
{
  while (x < 401)
  {
    strokeWeight(7);
    stroke(y, 100, 71);
    ellipse(20, x, 50, 50);
    stroke(140, y, 200);
    ellipse(x, 20, 50, 50);
    stroke(150, 24, y);
    ellipse(380, z, 50, 50);
    stroke(x, 245, 45);
    ellipse(z, 380, 50, 50);
    strokeWeight(1);
    stroke(255);
    ellipse(200, 200, x, w);
    ellipse(200, 200, w, x);
    w = w + 1;
    x = x + 7;
    y = y + 3;
    z = z - 7;
  }
}
void circle()
{
  int e = 5;
  int f = 5;
  while(f < 400)
  {
    stroke(f, 50, e);
    ellipse(200, 200, f, f);
    e = e + 1;
    f = f + 10;
  }
}
