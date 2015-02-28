
float x,y;
float radius = 100;
float lastx = 300;
float lasty = 300;

void setup()
{
  size(500, 700);
  background(265,265,0);
  frameRate(22);
}

void draw()
{
  //background(0, 190, 200);
  stroke(22,200,99,90);
  strokeWeight(0.10);
  
  for(float ang=3; ang<=36; ang+=360){
    float rad = radians(ang);
    x = (width/4 + (random(360)+radius*cos(rad)));
    y = (height/2 + (random(63)+radius*sin(rad)));
    //for darwing line and constructing circle
    
    line(x, y, lastx, lasty);
    line(width/4, height/8, lastx, lasty);
    lastx = x;
    lasty = y;
      int numPoints = int(map(mouseX, 0, width, 116, 160));
  float angle = 0;
  float angleStep = 180.0/numPoints;
    
 
  } 
 }
