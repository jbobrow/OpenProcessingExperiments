
//Benson L, CP1 Mods 14-15, One Hundred Shapes
int x = 1;
int y = 1;
int z = int(random(475));
void setup()
{
  size(500, 500);
  frameRate(1.25);
}
void draw()
{
  background(random(256),random(256),random(256));
  while (x <= 34)
  {
    fill(int(random(255)), int(random(255)), int(random(255)),150);
    ellipse(int(random(500)), int(random(500)), 50, 90);
    rect(int(random(500)), int(random(500)), 70, 60);
    triangle(z, z-25, z-25, z+50, z+25, z+50);
    x++;
    z = int(random(475));
  }
  if (x >=34)
  {
    x = 1;
  }
}
