
int height = 200;
int width = 200;
int circleSize = 100; // do not call the variable "size" ! Conflict with size()
 
 
void setup() {
  size(width, height);
  background(255);  //set background white
  smooth();
  ellipseMode(CENTER);
  //Circle 1
  fill(255,255,0);
  ellipse(width/2,height/2,circleSize,circleSize);
  //Circle 2
  fill(0,0,0);
  ellipse(120,80,10,10);
  
  //Rectangle
  pushMatrix();
  translate(100,100);  
  rotate(radians(45)):  
  fill(255);
  rect(0,0,50,50);
  popMatrix();
  }
