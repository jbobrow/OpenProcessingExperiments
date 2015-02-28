
//Sydney C CP1 mods: 4/5 One Hundred Random Shapes
int g = 255;
int b = 123;
int r, xOffset, yOffset, zOffset;
int siz = 20;
int x = 1;
void setup()
{
  size(300, 300, P3D);
  frameRate(2);
}

void draw()
{
  background(0,150,int(random(255)));
  smooth();
  
  while (x <= 100)
  {
    fill(r, g, b);
    r = int(random(255));
    g = g - 1;
    b = b + 1;
    xOffset = int(random(300));
    yOffset = int(random(300));
    zOffset = int(random(-300));
    translate(xOffset, yOffset, zOffset);
    box(siz);
    translate(-xOffset, -yOffset, -zOffset);
    x = x + 1;
    siz = siz + 1;
  }
  if (x>100)
  {
    x = 1;
    siz = 20;
    g = 255;
    b = 123;
  }
  
}
