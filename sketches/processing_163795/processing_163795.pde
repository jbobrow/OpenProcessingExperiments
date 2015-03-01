
void setup()
{
  size(600,600);
  smooth();
}

void draw()
{
  
  smooth();
  for(int i=0; i<1000; i+=10)
  {
    float x = random(width);
    float y = random(height);
    float size = random(20,30);
    line(x,y,x,y+size);
  }
}
