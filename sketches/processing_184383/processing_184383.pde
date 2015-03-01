
float x, y, z; 
int i; 

void setup()
{
  size(300, 300);
}

void draw()
{
  background(47, 88, 87); 
  x = 0; 
  y = 0; 
  z = 50; 

  for (int i = 0; i < 300; i = i + 10) 
  {
    fill(85, i, 183); 
    for (int j = 0; j < 300; j = j + 10) 
    {

      rect(j, i, 5, 5);
    }
  }
  while (x < 250 && y < 300) 
  {
    fill(x - 10, 100, 100); 
    ellipse(x, y, z, 10); 
    x = x + 10; 
    y = y + 10; 
    z = z + 5;
  }
  while (x > 300 && y > 300)
  {
    fill(x - 10); 
    ellipse(x, y, z, 50); 
    x = x - 10; 
    y = y - 10; 
    z = z + 5;
  }
}

