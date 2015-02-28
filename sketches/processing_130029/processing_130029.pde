

//This is how far the mouse traveled
//in the last frame.
float mouseSpeed = 0;

//We want to smooth out the mouse speed to
//make the drawing less jerky. This variable
//will store the smoothed-out value.
float smoothedSpeed = 0;

//The mouse speed is usually a pretty small
//value, so we will want to make it bigger to
//get a nice visual result.
float sizeMultiplier = 6;
//Likewise, we always want to have something on
//screen, even if the mouse hasn't moved. So
//we set a minimum size for the ellipse.
float minimumSize = 20;

//This is the position of the virtual pen
//that draws the circles.
float penX, penY = 0;

//This is a place to put the final calculated
//size of the ellipse.
float ellipseSize = 0;

void setup() {
  size (400, 400);
  fill(255,255,255);
}


void draw() {
  background(120,130,140);
  
  //Measure how far the mouse has traveled since the last
  //frame.
  mouseSpeed =  dist(mouseX, mouseY, pmouseX, pmouseY);
  mouseSpeed = mouseSpeed * sizeMultiplier;
  
  //Ease the speed using lerp. This makes the ball
  //grow or shrink slowly rather than popping between
  //different sizes.
  smoothedSpeed = lerp(smoothedSpeed, mouseSpeed, 0.05);
  
  //Move the pen so that it tracks the mouse.
  penX = lerp(penX, mouseX, 0.15);
  penY = lerp(penY, mouseY, 0.15);
  
  ellipseSize = minimumSize+smoothedSpeed;
  
  //Draw the ellipse under the pen.
  ellipse (penX, penY, ellipseSize, ellipseSize);
}




