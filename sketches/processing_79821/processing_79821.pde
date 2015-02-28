
int circleX = 60;
int circleY = 60;
int circleA = 150;
int circleB = 150;
int t = 2;
int v = 3;
int x = 6;
int y = 2;
void setup()
 
{
  size(1000,800 );
  smooth();
}
 
void draw()
{
  background(5,5,5);
 
  fill(0,25,255);
  ellipse(circleX, circleY, 400, 400);
  fill(0,255,0);
  ellipse(circleA, circleB, 100, 100);
  circleX = circleX + t;
  circleY = circleY + v;
  circleA = circleA + x;
  circleB = circleB + y;
 
  if (circleX > width-40 || circleX < 40) {
    t = t * -1;
  }
 
  if (circleY < 40 || circleY > height-40)
  {
    v= v* -1;
  }
  if (circleA > width-25 || circleA < 25) {
    x = x * -1;
  }
 
  if (circleB < 25 || circleB > height-25)
  {
    y= y* -1;
  }
}



