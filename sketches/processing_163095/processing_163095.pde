
float radius = 200;
float curDeg = 0;

void setup()
{
  size(600,600);
  frameRate(36);
}
void draw()
  {
    background(0);
    translate(width/2, height/2);
    
    curDeg += 6;
    float rad= radians(curDeg);
    float x= radius * cos(rad);
    float y= radius * sin(rad);
    line(0,0,x,y);
    
    stroke(0);
    fill(y,x,10,60);
    ellipse(0,0, x,y);
    
    fill(y,x,10,60);
    ellipse(0,0,x+100,y-60);
    
    fill(y,x=30,10,100);
    ellipse(0,0,x-80,y-100);
  }

