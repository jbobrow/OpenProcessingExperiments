
void setup() {
  size(500, 500);
  background(195);
  noStroke();
}

float r = 500;
float f = 1;

void draw() {
  fill(255, 3);
  rect(0, 0, width, height);
  rotate(r);
  translate(r, r);
  fill(0, r/2, r/2);
  if (r < 0) {
    fill(0, r/-2, r/-2);
  }
  triangle(0, 0, 0, 50, 50, 0);
  r = r - f;
  if (r < -500) {
    r = 500;
  }
}

 
void keyPressed() {
  if (key == 'z') {
    f = f + .2
    r = 500
  }
  if (key == 'x') {
    f = f - .2
    r = 500
    if (f < 0.1) {
      f = 0.2;
    }
  }
}


