
void setup()
{
  size(300,500);
}  

void draw()
{
}

void keyPressed()
{
  int a = 500/3;
  fill(random(200)+55, random(64), random(200)+55);
  rect(0,0, 300,a);
  
  fill(random(64), random(64), random(200)+55);
  rect(0,a, 300,a);
  
  fill(random(200)+55, random(200)+55, random(64));
  rect(0,2*a, 300,a);
}
