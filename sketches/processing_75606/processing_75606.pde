
//Eric K, CP1 mods 4-5, Doubling Shapes
//url: http://ericsprogrammingsite.webs.com/Doubling_Shapes.html

/**
 Draws random numbered cubes, which double with each iteration.
 */

PFont font;
int x;
int y;
int z;
int i;
int lim = 1;
void setup()
{
  size(500, 500, P3D);
  font = loadFont("Garamond-Bold-32.vlw");
  textFont(font, 32);
  textAlign(CENTER, CENTER);
  textSize(20);
  noStroke();
  background(0);
  frameRate(0.5);
}
void draw()
{
  background(0);
  i = 1;
  while (i <= lim)
  {
    x = int(random(0, 500));
    y = int(random(0, 500));
    z = int(random(-500, 0));
    translate(x, y, z);
    fill(int(random(64, 192)), int(random(64, 192)), int(random(64, 192)), 128);
    box(50);
    fill(0);
    text(i, 0, 0, 25);
    translate(-x, -y, -z);
    i++;
  }
  fill(255);
  text("Number of cubes: "+lim, 250, 50, 50);
  if (lim < 65536)
  {
    lim*=2;
  }
  else
  {
    lim = 1;
  }
}
