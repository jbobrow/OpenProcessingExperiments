
//Brian C, One Hundred Random Shapes, CP1 Mods 16/17

void setup()
{
  size(450,450);
  frameRate(1);
}
void draw()
{
  background(0);
  int whee = 1;
  while (whee<101)
  {
    fill(random(1,255),random(1,255),random(1,255),200);
    ellipse(random(30,420),random(30,420),random(15,50),random(15,50));
    whee++;
  }
}



