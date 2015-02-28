


// Circle shrinks and changes color



// Declare and initialize a float variables
float circleSize = 0;
float center;



void setup() {
  size(400,400);
  smooth();
  background(255);
  
  // "width" is a system variable -- Processing just gives it to you
  center = width / 2;
}

void draw() {
  
  // the blue + red levels are controlled by the frame count
  // mod (%) keeps the value from going past 255
  fill(255, 0, frameCount % 255, 50);
  stroke(frameCount % 255, 0,  255, 50);
  
  // Use the variables to specify the location and size of the circle.
  // we subtract from "width" to make it go smaller, not larger
  ellipse(center, center, width - circleSize, width - circleSize);
 
  // This will make the circle smaller on the next pass
  circleSize = circleSize + 1; 
  // Keep it within range
  circleSize = circleSize % width;
  
 
}

