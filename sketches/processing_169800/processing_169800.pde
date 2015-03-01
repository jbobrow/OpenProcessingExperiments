

float msc=0;

void setup() 
{
  size(500,500);
  smooth();  
}

void draw()
{
  background(255);
  translate(width/2,height/2);
  
  // clock circle
  strokeWeight(1);
  fill (175,175,255);
  stroke(175,175,255);
  ellipse(0,0,300,300);
  
  int m = minute();
  int h = hour();
  int s = second();
 
 
  //seconds
  stroke(175,175,255);
  strokeWeight(24);
  float sy=map(millis(),0,1000,0,10);
  float radSec=(360/60000 *second())+0.6*sy;
  pushMatrix();
  rotate(radians(radSec));
  line(0,0,0,-147);
  popMatrix();
 
  // minutes
  stroke(175,175,255);
  strokeWeight(24);
  float radMin=360/60*minute();
  pushMatrix();
  rotate(radians(radMin));
  line(0,0,0,-147);
  popMatrix();
  
  // hours
  strokeWeight(48);
  float radHour=360/12*hour();
  pushMatrix();
  rotate(radians(radHour));
  line(0,0,0,-147);
  popMatrix();
}
