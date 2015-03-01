
void setup()
{
  size(300,500);
}

void draw()
{
}

void keyPressed()
{
  background(random(255), random(255), random(255));
  
  int zz = int(random(9));
  int c = int(random(zz));
  
  int a = 1;
  int b = 1;
  int temp;
  
  for(int z = 0; z < zz; z++)
  {
    temp = b;
    b = a + b;
    a = temp;
    
    fill(random(255), random(255), random(255));
    rect(0,500-(500/(float(b)/c)), 300,500);
  }
  
}
