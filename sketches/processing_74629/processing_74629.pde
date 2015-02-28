
//Lawrence Jiang, Block 6 Comp Prog
//press left mouse button to decrease framerate
//press right mouse button to increase framerate


float f = 20;

void setup()
{
  size(800, 600);
  frameRate(f);
  strokeWeight(10);
}

void draw()
{
  background(0);
  int x = 1;
  fill(0);
  while (x<=100)
  {
    stroke(int(random(255)), int(random(255)), int(random(255)));
    ellipse (int(random(800)), int(random(600)), 50, 50);
    x++;
  }
  if (mousePressed==true && mouseButton==LEFT)
  {
    f = f - .5;
    frameRate(f);
  }
  if (mousePressed==true && mouseButton==RIGHT)
  {
    f = f + .5;
    frameRate(f);
  }
}
