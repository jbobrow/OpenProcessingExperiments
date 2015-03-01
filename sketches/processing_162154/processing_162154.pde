
int height = 250;
int width = 350;
int circleSize = 40; // do not call the variable "size" ! Conflict with size()
int transparency = 255;
 
 
void setup() {
  size(width, height);
  background(255);  //set background white
  ellipseMode(CORNER);
  //Circle 1
  fill(0,0,0,transparency);
  ellipse(0,0,circleSize,circleSize);
  //Circle 2
  transparency = 180;
  fill(0,0,0,transparency);
  ellipse(0,0,circleSize*2,circleSize*2);
  //Circle 3
  transparency = 105;
  fill(0,0,0,transparency);
  ellipse(0,0,circleSize*3,circleSize*3);
  //Circle 4
  transparency = 25;
  fill(0,0,0,transparency);
  ellipse(0,0,circleSize*4,circleSize*4);
  }
