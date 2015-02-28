
// The setup program is called one time at the beginning
// of the program.
void setup() {
  size(400,400);
  rectMode(CENTER);
  background(#FFFFFF);
  noStroke();
}
 
// the draw() function is called many times per second
// it's very useful for animating objects
 
// notice the opening and closing of curly braces
// everything in between them is run many times per second
 
void draw() {
   
  // draw a random mostly transparent rectangle 
  fill(random(255), random(255), random(255) ,20);
  rect(random(width),random(height),random(width),random(height));  
}
