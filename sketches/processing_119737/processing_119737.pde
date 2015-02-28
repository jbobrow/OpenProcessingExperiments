
float rect_X = 400;
float rect_Y = 400;
int lastTimeChanged;
int changeIntercal = 1000;

void setup() {
  size(800, 800);
}
 
void draw() {
  background(255);
  noStroke();
  for (int yPos = 0; yPos = height; yPos += height/20) {
    for (int xPos = 0; xPos <= width; xPos = xPos +40) {
  if (millis() > changeInteval + lastTimeChanged) {
    fill(random(255), random(255), random(255), random(255));
    lastTimeChanged = millis();
  }
}
  }
}
