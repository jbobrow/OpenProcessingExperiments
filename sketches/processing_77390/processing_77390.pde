
//Joe Liang, Doubling Shapes,14/15
int x = 1;
int y = 1;
void setup()
{
  size(600,600);
  
  frameRate(1);
}
void draw()
{
  background(0);
  
   
  while(x<=y)
  {
    fill(int(random(255)),int(random(255)),int(random(255)));
    ellipse(int(random(600)),int(random(600)),int(random(5)),int(random(5)));
    x++;
  }
  y=y+y;
  
}
