
int circleX = 250;
int circleXSpeed = 5;

void setup() {
  size (350, 600);
}

void draw () {
  background(200);
  ellipse (circleX, mouseY, 20, 20);

  circleX = circleX + circleXSpeed; //move the circle
  // if the circle's x position is greater than the width
  // change the direction the circle is moving in
  // change the circle's speed to negative

  if (circleX > width) {
    circleXSpeed = -20;
  }
  
  if(circleX<0){ 
    circleXSpeed = 10;
  
 // if the circle touches the left side of the screen
 //move the circle to the right-- change circle direction
 
 
 
      
    }
  }
