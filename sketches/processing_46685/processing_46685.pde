
void setup() {
  size(400, 400);
  background(0);

  smooth();
}

int rw = 25;
int rh = 180;
int er = 140;
float rd1 = 0.0;
float rd2 = 2.0;
int f1 = 0;
int f2 = 1;

void draw() {
  background(0);

  make_gear(width/2-65, height/2-65, rd1, f1);
  make_gear(width/2+56, height/2+61, rd2, f2);
}

void make_gear(int x, int y, float rd, int f) {
  rectMode(CENTER);
  ellipseMode(CENTER);

  fill(255, 230, 60);
  strokeWeight(4);
  stroke(225, 200, 30);

  pushMatrix();
  translate(x, y);
  rotate(PI/4+rd); 
  tint(100, 10);
  rect(0, 0, rw, rh);
  popMatrix();

  pushMatrix();
  translate(x, y);
  rotate(-PI/4.0+rd); 
  rect(0, 0, rw, rh);
  popMatrix();

  pushMatrix();
  translate(x, y);
  rotate(rd);
  rect(0, 0, rw, rh);
  popMatrix();

  pushMatrix();
  translate(x, y);
  rotate(rd);
  rect(0, 0, rh, rw);
  popMatrix();

  pushMatrix();
  translate(x, y);
  noStroke();
  ellipse(0, 0, er, er);
  popMatrix();

  pushMatrix();
  translate(x, y);
  fill(0);
  stroke(225, 200, 30);
  ellipse(0, 0, er/2, er/2);
  popMatrix();

  if (f == 0) {
    rd1 += 0.01;
  }
  else {
    rd2 -= 0.01;
  }
}


