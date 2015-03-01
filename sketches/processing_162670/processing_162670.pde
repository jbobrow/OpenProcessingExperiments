
float radius = 200;
float curDeg1 = 0;
float curDeg2 = 0;
float curDeg3 = 0;

void setup()
{
  size(600,600);
  frameRate(20);
}

void draw()
{
  background(170,210,220);
  translate( 300, 300);
  
  curDeg1 += 8;
  float rad1 = radians(curDeg1);
  float x1 = radius * cos(rad1);
  float y1 = radius * sin(rad1);
  ellipse(0,0,x1,y1);
  fill(#AA7929);
  
  curDeg2 += 2;
  float rad2 = radians(curDeg2);
  float x2 = radius * cos(rad2);
  float y2 = radius * sin(rad2);
  ellipse(100,100,x2,y2);
  fill(#DED828);
  
  curDeg3 += 24;
  float rad3 = radians(curDeg3);
  float x3 = radius * cos(rad3);
  float y3 = radius * sin(rad3);
  ellipse(-100,-100,x3,y3);
  fill(#CECEC8);
}
