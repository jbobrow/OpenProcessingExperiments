
//Hayley G, CP1, mods 14-15

int y;
void setup()
{
  y = 1;
  size(500, 500);
  frameRate(1);
}

void draw()
{
  background(0);
  int x = 1;
  while (x<=y) 
  {
    fill(int(random(255)), int(random(255)), int(random(255)), int(random(100,255)));
    triangle(0, 500, int(random(500)), int(random(500)), int(random(500)), int(random(500)));
    print(x);
    print(":");
    println(y);
    x++;
  }
  y = 2 * y;
  
  if(y>=600)
  {
    y = 1;
  }
}
