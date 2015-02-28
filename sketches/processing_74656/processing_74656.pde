
// Victor Murillo, CP1, mods 16/17, One Hundred Random Shapes
void setup()
{
  size(400, 400);
  frameRate(6);
}
void draw()
{
  background(0);
  int i = 1;
  while (i<=100)
  {
    stroke(0, 0, 255);
    fill(0, 255, 255, 127);
    ellipse(int(random(400)), int(random(400)), 40, 40);
    stroke(0, 255, 255);
    fill(255, 255, 255, 127);
    rect(int(random(400)), int(random(400)), 40, 60);
    i++;
  }
}
