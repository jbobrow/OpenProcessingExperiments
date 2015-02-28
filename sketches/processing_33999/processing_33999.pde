


/*assignment Catalina Cortzar*/


PFont font;
int lastSavedTime;
int timer = 0;
int timeInterval;
int timeCounter = 0;
int fullCycleCounter = 0;
boolean startCounting = false;
float mouseXClicked;
float mouseYClicked;

void setup() {

  size(600, 400);
  smooth();
  font = createFont("AmericanTypewriter", 48);
  textFont(font, 14);
  textAlign(CENTER);
  background(0);
  lastSavedTime = millis();
  timeInterval = 600;
  frameRate = 10;
}


void draw() {

  ellipse(width/2, height/2, 100, 100);
  timer = millis() - lastSavedTime;
  if (startCounting) {
    fill(0);
    text((timer/1000), width/2, height/2+40);
    fill(255, 20, 100);
  }
}

void mouseReleased() {

  lastSavedTime = millis(); 
  startCounting = true;
}


