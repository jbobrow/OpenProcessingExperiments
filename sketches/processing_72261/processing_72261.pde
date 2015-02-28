
// AlanChen
//RandomWalk
//14/15ComputerProgrammingClass
//http://alansprogrammingsite.webs.com/

int x = 250;
int y = 250;

void setup()
{
  size(600, 600);
  background(0);
}
 
void draw()
{
 rectangle();
}
 void rectangle()

{
  fill(255,0,255,150);
  stroke(0,255,123);
  strokeWeight(2);
  rect(x, y, 25, 25);
  rect(x, 500-y, 25, 25);
  rect(500-x, y, 25, 25);
  rect(500-x, 500-y, 25, 25);
  x = x + int (random(-10, 10));
  y= y + int (random(-10, 10));
  
}
