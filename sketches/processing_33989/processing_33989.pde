
// set up a simple timer to draw an ellipse 1 seconds after user clicks(note: millis in milliseconds, so 1 seconds = 1000 millis)
 
PImage bullseye;
PImage arrows;
 
float lastSavedTime;
float timeDelaySeconds = .2;
float timeDelay;
 
boolean drawarrowsTrue = false;
float mouseXClicked;
float mouseYClicked;
 
 
 
void setup() {
  background(0);
  bullseye = loadImage("bullseye.jpg");
  arrows = loadImage("arrows.png");
  lastSavedTime = millis();
  timeDelay = 1000*timeDelaySeconds;
  println(lastSavedTime);
  ellipseMode(LEFT);
  size(1024, 971);
  smooth();
  image(bullseye, 0, 0);
}
 
void draw() {
  if (millis() - lastSavedTime > timeDelay) {
    drawarrowsTrue = true;
  }
  if (drawarrowsTrue) {
    image(arrows, mouseXClicked, mouseYClicked);
    drawarrowsTrue = false;
  }
}
 
void mouseReleased() {
  lastSavedTime = millis();
  println(lastSavedTime);
  mouseXClicked = mouseX;
  mouseYClicked = mouseY;
}

