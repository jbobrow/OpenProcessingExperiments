
void setup()
{
  size(300,300);
  frameRate(10);
}

void draw()
{
  background(0);
  int x =1;
  while(x<=100)
  {
    fill(int(random(255)),int(random(255)),int(random(255)));
    rect(int(random(300)),int(random(300)), 30, 30);
    fill(int(random(255)),int(random(255)),int(random(255)));
    ellipse(int(random(300)),int(random(300)), 20, 20);
    x=x+1;
  }
}


