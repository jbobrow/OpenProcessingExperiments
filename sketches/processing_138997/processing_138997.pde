
int time1 = 2000;
 
void setup() {
  size(800, 800);
  frameRate(10);
}
 
void draw() {
  background(255);
  noStroke();
  int currentTime = millis();
  if (currentTime > time1) {
    for (int i = 0; i < height; i += 15) {
      fill(0, 100, 150);
      ellipse(400, i, random(0, 400), 25);
      fill(0);
      ellipse(i, 400, 25, random(0, 400));
    }
  }
}


