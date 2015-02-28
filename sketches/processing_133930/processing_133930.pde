
float x,y;
float radius = 300;
float lastx = 220;
float lasty = 230;

void setup()
{
  size(1000, 700);
  background(160,16,50);
  frameRate(5);
}

void draw()
{
  //background(170, 190, 200);
  stroke(60,59,89,90);
  strokeWeight(0.5);
  
  for(float ang=0; ang<=180; ang+=5){
    float rad = radians(ang);
    x = (width/2 + (random(40)+radius*cos(rad)));
    y = (height/4 + (random(40)+radius*sin(rad)));
    //for darwing line and constructing circle
    
    line(x, y, lastx, lasty);
    line(width/5, height/5, lastx, lasty);
    lastx = x;
    lasty = y;

  } 
 }

