
int time1 = 2000;

void setup() {
  size(500, 500);
  frameRate(5);
}

void draw() {
  background(0);
  noStroke();
  int currentTime = millis();
  if (currentTime > time1) { 
    for (int i = 0; i < height; i += 50) {
      fill(255, 0, 0);
      rect(0, i, random(0, 600), 25);
      fill(255);
      rect(i, 0, 25, random(0, 600));
    }
  }
}



