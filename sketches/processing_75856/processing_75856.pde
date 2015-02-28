
  int x=1;
  int z=1;
void setup()
{
  size(500,500);
  frameRate(1);
}
void draw()
{
  background(0);
  fill(255);
  while(x<=z)
  {
   rect(random(0,480),random(0,480),random(20,100),random(20,100));
   x++;
}
z=z*2;

if(z>5000)
{z=z*0;}
}
