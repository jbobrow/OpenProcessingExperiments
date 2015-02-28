
// use this to store which key was pressed
int keyboard;

void setup() {
  size(800, 600);
  background(255);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
}

void draw() {
   // change to a random color
  fill(random(360), 80, 80, 80);

  // check if the mouse is down
  if (mousePressed) {
    // check if it's the left mouse button
    if (mouseButton == LEFT) {
      // check if the last key pressed was a c (for circle)
      if (keyboard == 'c') {
        ellipse(random(width), random(height), 20, 20);
      }
      // otherwise, check if the last key was r (for rectangle)
      else if (keyboard == 'r') {
        rect(random(width), random(height), 20, 20);
      }
    }
  }
}

void keyPressed() {
  // space bar clears the screen
  if (key == ' ') {
    background(360);
  }
  
  // record which key was pressed to check later
  keyboard = key;
}
