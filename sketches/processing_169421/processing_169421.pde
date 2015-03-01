
float r=0;
float t=0;
void setup() {
  size(600, 600);
  background(0, 244, 100);
  rectMode(CENTER);
  noStroke();
  smooth();
}
void draw() {
  r=r+.01;
  translate(300, 300);
  if (r<2*PI) {
    rotate(r);
    rect(0, 40, 30, 30);
    rotate(-2*r);
    rect(0, 80, 30, 30);
    rotate(2*r);
    rect(0, 120, 30, 30);
    rotate(-2*r);
    rect(0, 160, 30, 30);
    rotate(2*r);
    rect(0, 200, 30, 30);
  } else if (r<4*PI) {
    rotate(r);
    fill(0, 244, 100);
    rect(0, 40, 10, 30);
    rotate(-2*r);
    rect(0, 80, 10, 30);
    rotate(2*r);
    rect(0, 120, 10, 30);
    rotate(-2*r);
    rect(0, 160, 10, 30);
    rotate(2*r);
    rect(0, 200, 10, 30);
  } else if (r<6*PI) {
    rotate(r);
    fill(255);
    rect(0, 40, 10, 25);
    rotate(-2*r);
    rect(0, 80, 10, 25);
    rotate(2*r);
    rect(0, 120, 10, 25);
    rotate(-2*r);
    rect(0, 160, 10, 25);
    rotate(2*r);
    rect(0, 200, 10, 25);
  } else if (r>=6*PI) {
    rotate(r);
    fill(0, 244, 100);
    rect(0, 40, 10, 23);
    rotate(-2*r);
    rect(0, 80, 10, 23);
    rotate(2*r);
    rect(0, 120, 10, 23);
    rotate(-2*r);
    rect(0, 160, 10, 23);
    rotate(2*r);
    rect(0, 200, 10, 23);
  }
}

