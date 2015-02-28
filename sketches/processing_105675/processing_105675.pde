
// use this to store whether the sketch is running or not
boolean running = false;

void setup() {
  size(800, 600);
  background(255);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
}

void draw() {

  if (running) {
    // change to a random color
    fill(random(360), 80, 80, 80);
    ellipse(random(width), random(height), 20, 20);
  }
}

void mousePressed() {
  running = !running;
  
  // the above line is the same as doing this, but only
  // takes one line!
  //if (running == true) {
  //  running = false;
  //} else {
  //  running = true;
  //}
  
}

