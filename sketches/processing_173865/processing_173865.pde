
void setup() {
  size(500, 500);
  background(0, 20, 50);
}

void draw() {
  float qnt = 2;
  rectMode(CORNER);
  noStroke();
  fill(0, 20, 50, 20);
  rect(0, 0, 500, 500);
  Orbs orbs = new Orbs();
  for (int i=0; i<qnt; i++) {
    orbs.draw(random(500), random(500));
  }
  if (mousePressed) {
    qnt = 1;
  }
  else {
    filter(BLUR, 1);
  }
}

class Orbs {
  Orbs() {
  }
  void draw(float xL, float yL) {
    float scale = random(20, 40);
    float col = random(10);
    ;
    if (col>6) {
      fill(216, 206, 173, 50);
    } 
    else {
      fill(18, random(100, 150), random(200, 250), 50);
    }
    ellipse(xL, yL, scale, scale);
    ellipse(xL, yL, scale*1.5, scale*1.5);
  }
}

