
//Lawrence Jiang, Block 6, COMP PROG, Doubling Shapes
//press space to reset

float f = 5;
int d = 1;

void setup()
{
  size(800, 600);
  frameRate(2);
  strokeWeight(10);
}

void draw()
{
  background(0);
  
  fill(0);
  int x = 1;
  while (x<=d)
  {
    stroke(int(random(255)), int(random(255)), int(random(255)));
    ellipse (int(random(800)), int(random(600)), 10, 10);
    x++;
  }
   d= d + d;
   println(d);
}

void keyPressed()
{
  if (key==' ')
  {
    d = 1;
  }
}
