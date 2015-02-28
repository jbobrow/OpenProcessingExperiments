
int aDir = -1;
int bDir = +3;
int cDir = -2;

void setup() {
  size(640, 360);
  noStroke();
}


void draw() {
  background(255);
  drawA();
  drawB();
  drawC();
  aDir -= 1;
  bDir += 3;
  if(bDir > 20) bDir = 0;
  cDir -= 2;
}


void drawA() {
  for(int aX = 0 + aDir; aX < width; aX += 60) {
    fill(random(255), random(255), random(255));
    rect(aX, 0, 40, 120);
  }
}


void drawB() {
  for(int bX = -20 + bDir; bX < width; bX += 20) {
    fill(random(255), random(255), random(255));
    rect(bX, 120, 10, 120);
  }
}

void drawC() {
  for(int cX = 0 + cDir; cX < width; cX += 50) {
    fill(random(255), random(255), random(255));
    beginShape();
    vertex(cX + 0, 240);
    vertex(cX + 30, 240);
    vertex(cX + 60, 360);
    vertex(cX + 30, 360);
    endShape(CLOSE);
  }
}


