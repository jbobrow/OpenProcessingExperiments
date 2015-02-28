
PImage robot;

float rw = 25*1.5;
float rh = 180*1.5;
float er = 140*1.5;
float rd1 = 0.0;
float rd2 = 2.0;
int f1 = 0;
int f2 = 1;

void setup() {
  size(550, 500);
  background(100, 80, 150);

  robot = loadImage("robot.png");
  imageMode(CENTER);

  smooth();
}

void draw() {
  background(100, 80, 150);

  make_gear(width/2-120, height/2-65, rd1, f1);
  make_gear(width/2+130, height/2-60, rd2, f2);

  noTint();
  image(robot, width/2-30, height/2+10);
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
  fill(100, 80, 150);
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


