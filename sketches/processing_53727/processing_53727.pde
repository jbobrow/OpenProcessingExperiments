
//This sketch was created by language_tool.

float a,b,c,d,Sa,Sb,Sc,Sd;
float x,y, x1, y1;
float targetX, targetY, targetX1, targetY1;
float easing = 0.05;
float easingb = 0.05;

void setup()
{
  size(500,500);
  background(255);
  

}

void draw()
{

  //10 lines from processing.org
    targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  
      targetX1 = mouseY;
  float ddx = targetX - x;
  if(abs(ddx) > 1) {
    x += ddx * easing;
  }
  
    targetY1 = mouseX;
  float ddy = targetY - y;
  if(abs(ddy) > 1) {
    y += ddy * easing;
  }

    println(ddx);
  
    a = x;
  b = y;
  c = mouseX; 
  d = mouseY;
  Sa = 20;
  Sb = 20;
  Sc = 20;
  Sd = 20;

    fill(200,30,20,100);
//apply unpredictaball physics to rect coordinates.
 ellipse(a,b,Sa,Sb);
 line(a,b,c,d);
 rect(c,d,Sc,Sd);
// line(a,b,x1,y1);
// rect(x1,y1,Sc,Sd);

   fill(30,30,200,200);
   if( ddy < -10 || ddy < 10){;
   fill(30,200,30,200);
   }else{
   fill(30,30,200,200);
   }
    rect(targetY1,y,ddy,ddx);
}
void mouseReleased()
{
  background(255);
}


