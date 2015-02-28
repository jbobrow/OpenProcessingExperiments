
float x,y;
float radius = 300;
float lastx = 220;
float lasty = 230;

void setup()
{
  size(1000, 700);
  background(255, 255, 255);
  frameRate(5);
}

void draw()
{
  //background(170, 190, 200);
  stroke(80, 73, 73, 100);
  strokeWeight(0.5);
  
  for(float ang=0; ang<=360; ang+=5){
    float rad = radians(ang);
    x = (width/2 + (random(50)+radius*cos(rad)));
    y = (height/2 + (random(50)+radius*sin(rad)));
    //for darwing line and constructing circle
    
    line(x, y, lastx, lasty);
    line(width/2, height/2, lastx, lasty);
    lastx = x;
    lasty = y;

  } 
 }


