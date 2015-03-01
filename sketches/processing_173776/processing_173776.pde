
void setup()
{
  size(500,300);
}

void draw()
{
}

void keyPressed()
{
  int a,b,temp;
  background(0);
  
  a=1;
  b=1;
  for(int z = 0; z < 6; z++)
  {
    temp = b;
    b = b+ a;
    a = temp;
    
    fill(random(255), random(255), random(255));
    triangle(0,150, 250,150-150/a, 500,150);
    triangle(0,150, 250, 150+150/a, 500,150);
  }
}
