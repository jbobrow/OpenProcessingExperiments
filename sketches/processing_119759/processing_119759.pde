
float rect_X = 400;
float rect_Y = 400;
int lastTimeChanged;
int changeInterval = 1000;
color randomSquareColor = color(random(255), random(255), random(255), random(255));
void setup() {
  size(800, 800);
  lastTimeChanged = 0;
  noStroke();
}

void draw() {
  if (millis() > changeInterval + lastTimeChanged) {
    background(255);
    randomSquareColor = color(random(255), random(255), random(255), random(255));
    lastTimeChanged = millis();
    for (int yPos = 0; yPos <= height; yPos += height/20) {
      for (int xPos = 0; xPos <= width; xPos = xPos +40) {
        float minuteMap = map(second(), 0, 59, 0, width);
        if (xPos == 200) {
          fill(200, 30, 10);
        } else {
          //fill with random color
          fill(randomSquareColor);
        }
        rect(xPos, yPos, 20, 20);
      }
    }
  }
}

