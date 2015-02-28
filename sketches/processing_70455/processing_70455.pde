
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 3-2: mouseX and mouseY

void setup() {
  size(200,200);
  background(255);
}

void draw() {
  // Try moving background() to setup() and see the difference!
  

  // Body
  stroke(mouseY);
  fill(mouseX);
  rectMode(CENTER);
  
  // mouseX is a keyword that the sketch replaces with the horizontal position of the mouse.
  // mouseY is a keyword that the sketch replaces with the vertical position of the mouse.
  rect(100, 100, mouseX,mouseY);   
}

