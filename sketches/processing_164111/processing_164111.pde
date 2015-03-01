
void setup()
{
  size(700, 500);
}

void draw()
{
}

void keyPressed()
{
  int d;
  int e;
  int f;
  int a = int(random(255));
  int b = int(random(255));
  int c = int(random(255));
  int z = int(random(9))+1;
  for (int k = 0; k < (z+1); k++)
  {
    d = (b+c)/2;
    e = (a+c)/2;
    f = (a+b)/2;
    a = d;
    b = e;
    c = f;
     fill(a,b,c);
    rect(700/z*k, 0, 700/z, 500); 
  }
  save("Test.png");
}
