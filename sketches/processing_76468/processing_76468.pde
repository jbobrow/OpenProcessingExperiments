
//Jun Min Z, CP1, Animation, Mods 16-17, Doubling Shapes

void setup()
{
  size(1000, 1000);
  textSize(50);
  frameRate(1.1);
}

int a=1;
int b=4;

void draw()
{
  background(255);

  int w=1;

  while (w<=a)
  {
    stroke(100);
    fill(255);
    ellipse(int(random(1000)), int(random(1000)), 10, 10);
    w++;
  }

  int x=1;
  while (x<=a)
  {
    noStroke();
    fill(0, 0, 0, 75);
    ellipse(int(random(1000)), int(random(1000)), 10, 10);
    x++;
  }

  int y=1;
  while (y<=a)
  {
    noStroke();
    fill(225, 225, 225, 250);
    ellipse(int(random(1000)), int(random(1000)), 10, 10);
    y++;
  }

  int z=1;
  while (z<=a)
  {
    stroke(200, 200, 200);
    noFill();
    ellipse(int(random(1000)), int(random(1000)), 10, 10);
    z++;
  }

  if (w>=a)
  {
    a=a*2;
  }

  if (x>=a)
  {
    a=a*2;
  }

  if (y>=a)
  {
    a=a*2;
  }

  if (z>=a)
  {
    a=a*2;
  }
  
  text(a,800,150);
  a=a*2;

  if (a==512)
  {
    a=1;
    w=1;
    x=1;
    y=1;
    z=1;
  }

}
