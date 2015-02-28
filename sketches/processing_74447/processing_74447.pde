

void setup()
{
  size(300, 300);
  frameRate(23);
  
}

void draw()
{
  background(0);
  int x=int(random(0,256));
  int y=int(random(0,256));
  int z=int(random(0,256));
  stroke(x, y, z);
  strokeWeight(3);
  fill(y,z,x);
  int po=1;
  while (po<=100)
  {

    ellipse (int(random(300)), int(random(300)), 30, 30);
    po++;
  }
}



