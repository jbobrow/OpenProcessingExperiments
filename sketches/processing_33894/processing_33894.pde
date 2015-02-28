
// set up a simple timer to draw an ellipse 1 seconds after user clicks(note: millis in milliseconds, so 1 seconds = 1000 millis)

PImage ParisWall;
PImage SpaceInvader;

float lastSavedTime;
float timeDelaySeconds = 0.5;
float timeDelay;

boolean drawSpaceInvaderTrue = false;
float mouseXClicked;
float mouseYClicked;

void setup() {
  background(0);
  ParisWall = loadImage("ParisWall.jpg");
  SpaceInvader = loadImage("SpaceInvader.png");
  lastSavedTime = millis();
  timeDelay = 1000*timeDelaySeconds;
  println(lastSavedTime);
  ellipseMode(CENTER);
  size(600, 749);
  smooth();
  image(ParisWall, 0, 0);
}

void draw() {
  if (millis() - lastSavedTime > timeDelay) {
    drawSpaceInvaderTrue = true;
  }
  if (drawSpaceInvaderTrue) {
    image(SpaceInvader, mouseXClicked, mouseYClicked);
    drawSpaceInvaderTrue = false;
  }
}

void mouseReleased() {
  lastSavedTime = millis();
  println(lastSavedTime);
  mouseXClicked = mouseX;
  mouseYClicked = mouseY;
}


