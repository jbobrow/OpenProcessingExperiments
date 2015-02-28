
//bouncing a circle off of the edge of the screen
//ben norskov
//feb 19, 2013
int circleX = 250; //where the circle is
int circleXSpeed = 2;//pixels per frame

void setup() {
  size(400, 400);
}

void draw() {
  background(200);
  ellipse(circleX, mouseY, 20, 20);
  
  circleX = circleX + circleXSpeed;//move the circle
  if (circleX > width) {  //if the circle's x position is greater than the width
    circleXSpeed = -2;//move the circle to the left
  }
  if (circleX < 0)   {
    //if the circle touches the left side of the screen
    //move the circle to the right - Change circle direction
    circleXSpeed = 2;
  }
}
