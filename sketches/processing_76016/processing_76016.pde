
// Keana Moezzi, CP1, mods 4-5, Doubling Shapes Assignment 


int y = 1; 

void setup()
{
  size(500, 500);
  frameRate(0.5);  
  textSize(50);
}
void draw()
{
  background(0);
  int x = 1;
  while (x<=y)
  {
    fill(random(255), random(255), random(255));
    ellipse(random(500), random(500), 20, 20);
    x = x + 1;
  }
  fill(255);
  text(y,50,50);
  if (x>=y)
  {
    y=y*2;
  }
  if (x>4096)
  {
    x = 1;
    y = 1;
  }
 
}
