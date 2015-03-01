
float angle = 0;
float offset = 300;
float scalar = 2;
float speed = .5;
float angle2 = 3;
float scalar2 = 5;
float speed2 = .5;

void setup()
{
  size(600,600);
  background(0);
  smooth();
  noStroke();
}

void draw() //ellipses
{
  float x = offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  ellipse (x,y,15,15);
  fill(255,0,0);
  angle += speed;
  scalar += speed;

//rectangles
  
  float xx = offset + cos(-angle2) * scalar2;
  float yy = offset + sin(-angle2) * scalar2;
  rect(xx,yy,12,12);
  fill(0,0,255);
  angle2 += speed2;
  scalar2 += speed2;
}


