
float t;
void setup()
{
  size(500,500);
}

void draw()
{

  int pointX,pointY,offset;
  float nodOffset;
  offset=60;
  pointX=mouseX-offset;
  pointY=mouseY-offset;
  ellipseMode(CENTER);
  rectMode(CENTER);
  background(255);
  stroke(0);
  fill(150);
  rect(100+pointX,100+pointY,20,100);
  
  t+=Distance(mouseX,mouseY)/200+0.1;
  nodOffset=sin(t)*3;
  println(mouseY);
  
  //head
  fill(255-Distance(mouseX,mouseY)/5,255,255);
  ellipse(100+pointX+nodOffset,70+pointY,60,60);
  fill(0);
  ellipse(81+pointX+nodOffset,70+pointY,16,32*Distance(mouseX,mouseY)/353.5);
  ellipse(119+pointX+nodOffset,70+pointY,16,32*Distance(mouseX,mouseY)/353.5);
  
  stroke(0);
  line(90+pointX,150+pointY,230,250);
  line(110+pointX,150+pointY,270,250);
}

float Distance(float x, float y)
{
  x=x-210;
  y=y-142;
  return sqrt(x*x+y*y);
}

