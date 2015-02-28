
// Global variables
int circleHeight = 50;
int pX = 400;
int pY = 200;
// color blueStroke = color(178, 74, 79); WHY WON'T THIS WORK?


// Basic setup of size, background, etc.
void setup () {
  size (800, 400);
  frameRate(30);
  colorMode(HSB, 360, 100, 100);
  background(178, 75, 8);
}

// Main functions are executed
void draw () {
  float circleWidth = random(600, 1200);
  float circleOpa = random(10, 30);
  
  noFill();
  stroke(178, 74, 79, circleOpa);
  ellipse(mouseX, mouseY, circleWidth, circleHeight);
  line(pX, pY, mouseX+random(-5, 5), mouseY+random(-5, 5));
  /* stroke(0);
     strokeWeight(abs(mouseX-pmouseX));
     line(pmouseX, pmouseY, mouseX, mouseY); */
}

// Mouseclick
void mousePressed () {
  circleHeight += 10;
  pX = mouseX;
  pY = mouseY;
}                               
