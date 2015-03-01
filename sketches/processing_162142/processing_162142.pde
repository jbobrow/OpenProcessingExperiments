
int height = 250;
int width = 350;
int circleSize = 120; // do not call the variable "size" ! Conflict with size()
int transparency = 180;


void setup() {
  size(width, height);
  background(255);  //set background white
  
  ellipseMode(CENTER);
  //Circle
  fill(0,0,255,transparency);
  ellipse(width/4,height/3,circleSize,circleSize);
  //Circle
  fill(255,0,0,transparency);
  ellipse(width*2/4,height/3,circleSize,circleSize);
  //Circle
  fill(0,255,0,transparency);
  ellipse(width*3/4,height/3,circleSize,circleSize);
  //Circle
  fill(255,255,0,transparency);
  ellipse(width*3/8,height*2/3,circleSize,circleSize);
  //Circle
  fill(0,255,255,transparency);
  ellipse(width*5/8,height*2/3,circleSize,circleSize);
  }
