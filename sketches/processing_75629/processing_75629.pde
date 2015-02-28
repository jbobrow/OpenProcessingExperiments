
//Bozhong H. Doubling Shapes CP1 Mods 14-15
int limits=1;
void setup()
{
  size(300,300);
  frameRate(1);
}
void draw()
{
  background(255);
  fill(int(random(255)),int(random(255)),int(random(255)));
  for(int i=1;i<=limits;i++)
  {
    ellipse(int(random(300)),int(random(300)),10,10);
  }
  limits=limits*2;
  if(limits>512)
  {
    limits=1;
  }
}
  


