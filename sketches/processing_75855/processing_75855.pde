
void setup()
{
  size(500,500);
  frameRate(1);
}
void draw()
{
  background(0);
  int x=1;
  int z=1;
  float c= pow(0,50);
  fill(255);
  while(x<=z)
  {
   ellipse(random(20,480),random(20,480),33,33);
   x++;
   z=z*2;
}
}
