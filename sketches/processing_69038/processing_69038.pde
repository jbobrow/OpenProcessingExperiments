
//Aaron L., Pengiuin, CP1, Mods 4-5
//http://aaron1.webs.com
size(500, 500);
smooth();
noFill();
background(0, 0, 0);

int x = 5;
int y = 5;
int w = 15;
int z = 15;
while (x < 500)

{
  x = x + 15;
  y = y + 15;
  w = w + 25;
  z = z + 25;
  stroke(255, 255, 255);
  ellipse(250, 250, 500-w, 500-z);
  fill(random(255), 100, 255, 50);
  ellipse(x, y, 80, 80);
  ellipse(500-x, y, 80, 80);
  ellipse (250, y, 80, 80);
  ellipse (x, 250, 80, 80);
}
