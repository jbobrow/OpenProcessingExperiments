
int circleX = 250; //where the cirlce is
int that_shit_cray= 2; //pixles per frame
void setup() {
  size(350, 600);
}

void draw() {
  background(200);
  circleX= circleX+that_shit_cray;
  ellipse(circleX, mouseY, 100, 100);


  circleX=circleX + that_shit_cray;//move the circle
  //change the direction the circle is moving in 
  //change the circle's speed to negative
  if (circleX>width) { //if the circle's x position is greater than the width
    that_shit_cray= -2;
  }
  if (circleX < 0) {
    //if the circle touches the left side of the screen 
    //move the circle to the right-change circle direction
    that_shit_cray = 2;
  }
}
