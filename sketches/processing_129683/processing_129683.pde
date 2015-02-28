
//copyright Laura Contero 2014
//ICE 3

//variable declarations
  float x, y;
  float wd, ht;
  float xDist, yDist;
  float easingCoef;
  
void setup()
{
  size( 400, 400);
  noCursor();
  easingCoef = .1;
}

void draw()
{
  //background(0);
  fill(0, 10);
  noStroke();
  ellipseMode(CENTER);
  ellipse( x, y, wd, ht);
  
  xDist = mouseX-x;
  yDist = mouseY-y;
  
  x = x+xDist*easingCoef;
  y = y+yDist*easingCoef;
  wd = 40;
  ht = 40;
}
  


