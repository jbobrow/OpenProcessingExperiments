
int circleX=50;
int circleY=50;
int t=5;
int m=7;

// happens just once

void setup()
{
  size(400,400);
  smooth();
  colorMode(HSB);
  
}
// happens over & over
void draw()
{
  fill(mouseX,mouseY,mouseX,10);
  rect(0,0,width,height);
  
  fill(mouseX,mouseY,mouseY,255);
  ellipse(circleX,circleY,20,20);
 
  noStroke();
  fill(0,0,255);
  circleX=circleX+t;
  circleY=circleY+m;
  
  if(circleX>390){
    t=t * -1;
  }
  if(circleX< 10){
    t=t * -1;
  }
    if(circleY>390){
      m=m * -1;
    }
    if(circleY<10){
      m=m * -1;
    }
    
}

