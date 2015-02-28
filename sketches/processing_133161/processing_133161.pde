
void setup()
{
  size(1200, 600);
}

void draw()
{
  background(20, 20, 20);
  //for(int i=0; i>=600; i=i+100)
  //{
  //strokeWeight(0.5);
  //smooth();
  for (float i=0; i<=1200; i=i+random(20))
  {
    stroke(random(100+i), 100, 100);
    line(0, 600, i, 0);
  }

  for (float j=1200; j>=0; j=j-random(10))
  {
    stroke(random(100), random(100+j), 100);
    line(1200, 600, j, 0);
  }

  for (float k=0; k<=1200; k=k+random(30))
  {
    stroke(random(100), random(100), random(100+k));
    line(0, 0, k, 600);
  }

  for (float l=1200; l>=0; l=l-random(20))
  {
    stroke(random(100), random(100+l), 100);
    line(1200, 0, l, 600);
  }
}



