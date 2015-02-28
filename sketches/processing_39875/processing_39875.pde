
void setup() {
  size(450, 400);
  noFill();
  noLoop();
  smooth();
}

void draw() {
  translate(width/2, height/2);
  for (int i = 0; i<19; i++) {
    curveTightness(2);
    rrr(8+i*10, 3+i, i*10);
  }
}

void rrr(float ra, int num, int r) {
  float an = TWO_PI/num;
  rotate(an);
  beginShape();
  for (int i = 0; i<num; i++) {
    float x = sin(i*an)*ra;
    float y = cos(i*an)*ra;
    curveVertex(x, y);
  }
  endShape();
}
