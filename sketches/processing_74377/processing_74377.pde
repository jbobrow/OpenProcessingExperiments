
//Eric K, CP1 mods 4-5, One Hundred Random Shapes
//url: http://ericsprogrammingsite.webs.com/Hundred_Shapes.html

/**
  Draws one hundred random numbered cubes.
  Press the mouse button to reset.
*/

int x;
int y;
int z;
int i = 1;
void setup()
{
  size(500, 500, P3D);
  textAlign(CENTER, CENTER);
  textSize(25);
  background(0);
}
void draw()
{
  if (i <= 100)
  {
    x = int(random(0, 500));
    y = int(random(0, 500));
    z = int(random(-500, 0));
    translate(x, y, z);
    fill(int(random(0,256)), int(random(0,256)), int(random(0,256)), 128);
    box(50);
    fill(255);
    text(i, 0, 0, 25);
    translate(-x, -y, -z);
    i++;
  }
}
void mouseClicked()
{
  background(0);
  i = 1;
}
