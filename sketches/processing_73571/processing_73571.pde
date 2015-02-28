
void setup()
{
  size(500,500);
  frameRate(1);
}

void draw()
{
  background(0);
  int a= 1;
  while(a<=50)
  {
  int c= int (random(0,255));
  fill(c, c, 255-c, c);
  ellipse(int(random(500)), int(random(500)),50,50);
  rect(int(random(500)), int(random(500)), 50,50);
  a++;
  }
}
