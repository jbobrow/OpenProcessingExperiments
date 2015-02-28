

//  sketch: Four_Circle_Recursion.pde   9/2013

float f = 1.125;
float rot = 0.0;
float angle = TWO_PI / 500;

//---------------
void setup() 
{
  size(512, 512, P2D);
  noStroke();
  smooth();
}
//---------------
void draw() 
{
  background (255);
  rot = angle * frameCount;
  drawCircle(0,0, width, 6, rot);
}
//---------------
void drawCircle(float x, float y, float elliSize, int level, float rotAngle) 
{
  //println (level + " x="+x + " y="+y  + " s="+elliSize);  
  fill(126 * level / 4.0);
  ellipse(width/2+x, height/2+y, elliSize, elliSize);    
  elliSize = elliSize * 0.5;    
  if(level > 1) 
  {
    level--;
    if (level % 2 != 0) rotAngle = -rotAngle;
    float radius = elliSize * 0.5;
    float sr = sin(rotAngle);
    float cr = cos(rotAngle);
    drawCircle(x - cr * radius, y + sr * radius, elliSize, level, rotAngle);
    drawCircle(x + cr * radius, y - sr * radius, elliSize, level, rotAngle);
    sr = sin(rotAngle + HALF_PI);
    cr = cos(rotAngle + HALF_PI);
    radius = elliSize * 0.667;
    drawCircle(x - cr * radius, y + sr * radius, elliSize*0.667, level, rotAngle);
    drawCircle(x + cr * radius, y - sr * radius, elliSize*0.667, level, rotAngle);
  }
}
//---------------
void keyPressed() 
{ 
  if  (key == 's')  save ("Four_Circle_Recursion.png");  // save current view as picture file
}


