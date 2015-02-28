
int x, y;
int startTime;
boolean gotIt = false;
float showTime = 3000;
int bgColor = 150;
int score = 0;

// Set up the screen, and choose
// first random location for the ball
void setup() {
  size(400, 400);
  startTime = millis();
  fill(255, 0, 0);
  newRandomLocation();
}

// Draw the ball, or choose a new
// location for the ball
void draw() {
  background(bgColor);
  if (bgColor == 255)
    bgColor = 150;
  showScore();
  if (!gotIt && millis() - startTime < showTime) {
    fill(255 * (1 - (millis() - startTime)/showTime), 0, 0);
    ellipse(x, y, 50, 50);
    
  }
  else {
    newRandomLocation();
    
  }
}

// Select a new randomLocation for the ball
void newRandomLocation() {
  x = (int)random(0, width);
  y = (int)random(0, height);
  gotIt = false;
  startTime = millis();
}

// If the user clicks inside the ball, give
// them a point
void mousePressed() {
  if (dist(mouseX, mouseY, x, y) < 50) {
    score += 10;
    gotIt = true;
    showTime = 0.9 * showTime;
  }
  else
    bgColor = 255;
}

// Display the score in the bottom-left corner
void showScore() {
  fill(0);
  text(score, 3, height - 3);  
}

