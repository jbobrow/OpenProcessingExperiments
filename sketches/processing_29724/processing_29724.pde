
//dvdp! (04/06/2011, 2 am)

float speed = 0.007;
float angle = 0;

void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(0);
  for (int i = 1; i < 4; i++) {
    noFill();
    stroke(30);
    ellipse(250, 250, 125*i, 125*i);
    fill(240);
    noStroke();
    ship(angle, i);
  }
  angle += speed*2*PI;
  if (angle > 2*PI) {
    angle = angle - 2*PI;
  }
  println(angle);
}

void ship(float angle, int d) {
  pushMatrix();
  translate(250, 250);
  rotate(d*angle);
  translate(62.5*d,0);
  triangle(-7, 0, 7, 0, 0, 20);
  popMatrix();
}

