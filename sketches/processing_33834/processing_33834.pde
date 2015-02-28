
// set up a simple timer to draw an ellipse 1 seconds after user clicks(note: millis in milliseconds, so 1 seconds = 1000 millis)

float lastSavedTime;
float timeDelaySeconds = 1;
float timeDelay;

boolean drawCircleTrue = false;
float mouseXClicked;
float mouseYClicked;

void setup() {
  lastSavedTime = millis();
  timeDelay = 1000*timeDelaySeconds; 
  println(lastSavedTime);
  ellipseMode(CENTER);
  size(400, 400);
  smooth();
  fill(255, 20, 100);
}

void draw() {
  if (millis() - lastSavedTime > timeDelay) {
    drawCircleTrue = true;
  } 
  if (drawCircleTrue) {
    ellipse(mouseXClicked, mouseYClicked, 80, 80);
    drawCircleTrue = false;
  }
}

void mouseReleased() {
  lastSavedTime = millis();
  println(lastSavedTime);
  mouseXClicked = mouseX;
  mouseYClicked = mouseY;
}


