
//Bozhong H. 100 Shapes CP1 Mods 14-15
void setup()
{
  size(300,300);
  stroke(255);
  fill(0);
  frameRate(1);
}
void draw()
{
  background(0);
  int x=1;
  while(x<101)
  {
    ellipse(int(random(300)),int(random(300)),10,10);
    x++;
  }
}


