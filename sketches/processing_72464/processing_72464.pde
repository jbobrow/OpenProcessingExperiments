
// A "horse race" -- using variables that increase
// Every time a different winner!
 
 
// Declare and initialize four float variables
float rectX1 = 0;
float rectX2 = 0;
float rectX3 = 0;
float rectX4 = 0;
 float R = random(400);
 
void setup() {
  size(900,400);
  smooth();
  background(0);
}
 
void draw() {
   
  // the blue level is controlled by the frame count
  // mod (%) keeps the value from going past 255
  noFill();
   stroke(255);
  // Use the variables to specify the location of some rects.
  // mod (%) keeps the value from going off the right edge of the screen
  ellipse(rectX1 % width, 125, rectX1 % width, rectX1 % width);
  ellipse(rectX2 % width, 175, rectX2 % width, rectX2 % width);
  ellipse(rectX3 % width, 225, rectX3 % width, rectX3 % width);
  ellipse(rectX4 % width, 275, rectX4 % width, rectX4 % width);
   
  // Add some random number between 0 and 5
  // This will draw the rect further to the right on the next pass
  rectX1 = rectX1 + random(0, 5);
  rectX2 = rectX2 + random(0, 5);
  rectX3 = rectX3 + random(0, 5);
  rectX4 = rectX4 + random(0, 5);
  noStroke();
  fill(0, random(0, 10));
  rect(random(900),random(400),R,R);
}


