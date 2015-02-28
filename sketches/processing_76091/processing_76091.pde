
//Cristen W, CP1 Mods 16/17, Doubling Shapes

int limits;
void setup()
{
  size(500, 500);
  frameRate(1);
  limits = 1;
}
void draw()
{
  background(0);
  fill(255);
  stroke(255);
  line(10, 10, 10, 490);
  line(10, 10, 490, 10);
  line(490, 10, 490, 490);
  line(10, 490, 490, 490);
  int num = 1;
  while (num<=limits)
  {
    fill(random(10, 256), random(10, 256), random(10, 256), random(150, 246));
    stroke(random(10, 256), random(10, 256), random(10, 256));
    triangle(random(10, 490), random(10, 490), random(10, 490), random(10, 490), random(10, 490), random(10, 490));
    num++;
  }
  limits*=2;
  fill(255);
  stroke(255);
  textSize(50);
  text(limits/2, 40, 80);
  if (limits>=513)
  {
    limits=1;
  }
}
