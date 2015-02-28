
//Diana Chen
//cdiana@cmu.edu
// copyright 2012

int value =0; 
 
void setup()
{
  size(500, 500);
  smooth();
  background(0);
  frameRate(30);
}
void draw()
{
  noStroke();
  fill(random(0,255), random(0,255), random(0,255),50);
  ellipse(mouseX,mouseY,width/7,height/7);
}
 
void keyPressed()
{
  if(key == ENTER)
  {
      background(0);
  }
  
  else if (key != ENTER)
  { 
    background(255-value);
  }
  
  }
  



