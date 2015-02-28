
int timeCount=1;

void setup()
{
  
  size(500,500);
  frameRate(5);
}


void draw()
{
  
  background(0);
  
  fill(255);
  ellipse(width/4,height/4,100,100);
  ellipse(3*width/4,height/4,100,100);
  
  fill(0);
  ellipse(width/4,height/4,30,30);
  ellipse(3*width/4,height/4,30,30);
  
  if(millis()>3000*timeCount)
  {
    fill(0);
    rectMode(CENTER);
    rect(width/2,height/2,width,height);
    timeCount++;
  }
  
}
