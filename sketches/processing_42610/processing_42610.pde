
// http://about.me/ww1way

int num = 45;
PVector[] p = new PVector[num];

void setup() {
  size(450, 450);
  noLoop();
  smooth();
  for (int i = 0; i< num; i++) {
    p[i] = new PVector(random(30, width-30), random(30, height-30));
  }
}

void draw() {
  background(0);
  float w = random(40, 50);
  for (int i = 0; i< num; i++) {
    for (int j = 0; j<num;j++) {
      float dst = dist(p[i].x, p[i].y, p[j].x, p[j].y);
      if (dst<155) {
        fill(180, dst, 100, 65);
        noStroke();
        ellipse(p[i].x, p[i].y, 140-dst, 140-dst);
        stroke(120, 205-dst);
        line(p[i].x, p[i].y, p[j].x, p[j].y);
      }
    }
  }
}

