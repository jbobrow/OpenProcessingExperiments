
// generative_rectangles

// Variables ----------------------------------------
int rectX = 50;
int rectY = 50;
int savedTime;
int totalTime = 20000;

// Setup ----------------------------------------
void setup() {
  size(800, 200);
  smooth();
  background(#ffffff);
  savedTime = millis();
}

// Draw ----------------------------------------
void draw() {
  int passedTime = millis() - savedTime;
  noStroke();
  
  // Fill it with a random color of the blue-purple spectrums
  fill(random(255), random(255), 255, random(255));
  
  // If 10 seconds passes, start to use white boxes to transition out
  if(passedTime > totalTime) {
    fill(255, 255, 255, 255);
  }
  // Generate rectangles
  rect(random(width), random(height), random(rectX), random(rectY));
  
  // Add more white boxes to speed up end of animation
  if(passedTime > totalTime + 3000) {
    rect(random(width), random(height), random(width/2), random(height/2));
  }
  
  if(passedTime > totalTime + 10000) {
    setup();
  }
}
