
void setup() {
  size (400, 400);
  background(15, 31, 60);
}

void draw() {
  orb(60, 200, 75);
  orb(100, 100, 110);
  orb(220, 75, 50);
  orb(290, 200, 200);
  orb(170, 300, 150);
  noLoop();
}



void orb (float x, float y, float z) {

  for (float circle = z; circle>=0; circle-=z/5) {
    randomColor();
    strokeWeight(1.5);
    smooth();
    stroke(255);
    ellipse(x, y, z, circle);
    line(x, 0, x, y-(.5*z));
  }
}

void randomColor () {
  float s = random (1, 9);

  if (s <=4) {
    fill (0, 50, 250);
  };
  if (s>4 && s<=7) {
    fill (100, 150, 250);
  };
  if (s>7 &&s <=9) {
    fill (50, 150, 125);
  }
}


