
// define a variable for x-Position
float x = 10;
// define a variable for speed
float speed = 20;

// setup for initialization
void setup() {
  size(400, 400);
}

// draw is being called continuously
void draw() {
  // redraw background every frame
  background(0);
  
  // draw a circle at variable x-Position
  ellipse(x, 200, 20, 20);
  
  // increase x position by speed
  x = x + speed;
  
  // increase speed every frame for breaking motion
  speed = speed * 0.99;
  
  // if x position hits the 
  if ( x > 395 || x < 5 ) {
    speed = speed * -1;
  }
}
