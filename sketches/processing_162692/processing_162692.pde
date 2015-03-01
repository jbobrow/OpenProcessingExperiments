
float radius = 200;
float curDeg = 0;
float curDeg2 =0;


void setup()
{
  size(600,600);
  frameRate(50);

}

void draw()
{  background(25,200,200);
  translate(width/2, height/2);
  
  curDeg -= 6;
  float rad = radians(curDeg);
  float x = 200 * cos(rad);
  float y = radius * sin(rad);
  
    curDeg2 -= 6;
  float rad2 = radians(curDeg2);
  float x2 = 200 * cos(rad2);
  float y2 = radius * sin(rad2);
stroke(255);
rect(x2-5,y2-5,10,10);
line(0,0,x2,y2);

ellipse(0,0,10,10);
line(0-y,0,y,0);
rect(y2,-5,10,10);


}
