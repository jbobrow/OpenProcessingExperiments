
final int WIDTH = 300, HEIGHT = 300;
final int CX = WIDTH / 2, CY = HEIGHT / 2;
final int DIAM = 40;
float angle;
float deltaAngle;
float radius;
void draw()
{
  int x, y, x2, y2, x3, y3, x4, y4;
  smooth();
  background(0);
  x = getX();
  y = getY();
  x2 = getx2();
  y2 = gety2();
  x3 = getx3();
  y3 = gety3();
  x4 = getx4();
  y4 = gety4();
  line (CX, CY, x, y);
  ellipse(x , y, DIAM , DIAM);
  fill(0,255,0);
  line (CX, CY, x2, y2);
  ellipse(x2, y2, DIAM , DIAM);
  fill(255,0,0);
  line (CX, CY, x3, y3);
  ellipse(x3, y3, DIAM, DIAM);
  fill(0,0,255);
  line (CX, CY, x4, y4);
  ellipse(x4, y4, DIAM, DIAM);
  fill(255,239,0);
  angle = (angle + deltaAngle) % 360.0;
}
void setup()
{
size(300 , 300);
stroke (0);
frameRate(60);
angle = 0.0;
deltaAngle  = 1.0;
radius = ((WIDTH / 2) + (HEIGHT / 2)) / 3;
}
void mouseClicked()
{
  deltaAngle =- deltaAngle;
}
void keyPressed ()

{
  if (key == CODED)
    if (keyCode == UP) 
      deltaAngle += 2;
 
 
  if (keyCode == DOWN) 
    
  deltaAngle -= 2; 
}
int getX()
{
  float xcomponent = (radius * cos(radians(angle)));
  return int (xcomponent) + CX;
}
int getY()
{
  float ycomponent = (radius * sin(radians(angle)));
  return int (ycomponent) + CY;
}
int getx2()
{
  float xcomponent = (radius * cos(radians(angle + 90)));
  return int (xcomponent) + CX;
}
int gety2()
{
  float ycomponent = (radius * sin(radians(angle + 90)));
  return int (ycomponent) + CY;
}
int getx3()
{
  float xcomponent = (radius * cos(radians(angle + 180)));
  return int (xcomponent) + CX;
}
int gety3()
{
  float ycomponent = (radius * sin(radians(angle + 180)));
  return int (ycomponent) + CY;
}
int getx4()
{
  float xcomponent = (radius * cos(radians(angle + 270)));
  return int (xcomponent) + CX;
}
int gety4()
{
  float ycomponent = (radius * sin(radians(angle + 270)));
  return int (ycomponent) + CY;
}

                
                                
