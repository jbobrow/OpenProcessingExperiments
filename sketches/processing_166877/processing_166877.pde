
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 6-8: Lines one at a time

 // No for loop here. Instead, a global variable.
int y = 0;

void setup() {
  size(200,200);
  background(255);
  // Slowing down the frame rate so we can easily see the effect.
  frameRate(2); 
}

void draw() {
  // Draw a line
  stroke(0);
  // Only one line is drawn each time through draw().
  line(0,y,y,height); 
  // Increment y
  y += 10;
  
  // Reset y back to 0 when it gets to the bottom of window
  if (y > height) {
    noLoop();
  }
}
