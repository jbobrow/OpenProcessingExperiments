


// A "horse race" -- using variables that increase
// Every time a different winner!


// Declare and initialize four float variables
float rectX1 = 0;
float rectX2 = 0;
float rectX3 = 0;
float rectX4 = 0;


void setup() {
  size(400,200);
  smooth();
  background(255);
}

void draw() {
  
  // the blue level is controlled by the frame count
  // mod (%) keeps the value from going past 255
  fill(255, 0, frameCount % 255);
  
  // Use the variables to specify the location of some rects.
  // mod (%) keeps the value from going off the right edge of the screen
  rect(rectX1 % width, 0, 50, 50);
  rect(rectX2 % width, 50, 50, 50);
  rect(rectX3 % width, 100, 50, 50);
  rect(rectX4 % width, 150, 50, 50);
  
  // Add some random number between 0 and 5
  // This will draw the rect further to the right on the next pass
  rectX1 = rectX1 + random(0, 5); 
  rectX2 = rectX2 + random(0, 5);
  rectX3 = rectX3 + random(0, 5);
  rectX4 = rectX4 + random(0, 5);
 
}


