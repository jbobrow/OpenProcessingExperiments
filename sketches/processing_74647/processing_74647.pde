
//Simon L, 100 random shapes, CPU1 Mods 14-15
void setup()
{
  size(500, 500);
  noStroke();
  frameRate(2);
}
void draw()
{
  background(int(random(0, 256)), int(random(0, 256)), int(random(0, 256)));
  int i = 1;
  while (i<=100)
  {
    fill(int(random(0, 256)), int(random(0, 256)), int(random(0, 256)));
    int a = int(random(0, 500));
    int b = int(random(0, 500));
    int c = int(random(50, 100));
    int d = int(random(50, 100));
    int e = int(random(0, 500));
    int f = int(random(0, 500));
    int g = int(random(50, 100));
    int h = int(random(50, 100));
    ellipse(a,b,c,d);
    i++;
  }
  if(keyPressed)
  {
    if(keyCode == UP)
    {
      frameRate(60);
    }
    else if(keyCode == DOWN)
    {
      frameRate(1);
    }
    else if(keyCode == RIGHT)
    {
      frameRate(2);
    }
    else
    {
      frameRate(0.5);
    }
  }  
}
