
//Perry Phan, 4/5, Comp Prog 1, One Hundred Loops

void setup()
{
  size(400,400);
  frameRate(4);
}

void draw()
{
  background (random(255),random(255),random(255));
  int x = 1;
  while(x<=100)
  {
  fill(random(255),random(255),random(255),random(255));
    ellipse(random(400),random(400),50,50);
    x=x+1;
  }
}
