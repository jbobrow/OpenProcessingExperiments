
int score = 0;
float x = -PI/2;
float r = 0;
float xSpeed = 2*PI/360;
float rSpeed = 2*PI/360;

void setup() {
  size(300, 300);
}

void draw() {
  background(150);
  if (keyPressed && key == ' ') {
    xSpeed = -4*PI/360;
    rSpeed = -4*PI/360;
    score += addScore(x);
  }
  else {
    xSpeed = 2*PI/360;
    rSpeed = 2*PI/360;
  }
  gauge();
  cube();
  translate(0, 0);
  rotate(0);
  textAlign(LEFT);
  text(score, 10, 10);
  textAlign(RIGHT);
  text("X " + addScore(x), width-10, 10);
}

void cube() {
  pushMatrix();
  beginShape();
  stroke(0);
  strokeWeight(7);
  noFill();
  translate(width/2, height/2);
  rotate(r);
  vertex(0, 80);
  vertex(-60, 50);
  vertex(-60, -30);
  vertex(0, -55);
  vertex(60, -30);
  vertex(60, 50);
  vertex(0, 80);
  line(0,0,0,80);
  line(0,0, 60, -30);
  line(0,0,-60,-30);
  endShape();
  r += rSpeed;
  popMatrix();
}

void gauge() {
  noFill();
  stroke(60, 255, 0);
  strokeWeight(10);
  arc(width/2, height/2, 280, 280, -PI/2, x);
  x += xSpeed;
  if (x >= 3*PI/2 - PI/180) {
    background(150);
    x = -PI/2;
    r = 0;
  }
}

int addScore(float x) {
  if (x >= 4*PI/3) {
    return 5;
  }
  else if (x >= PI) {
    return 3;
  }
  else if (x >= PI/2) {
    return 2;
  }
  else if (x >= -PI/2) {
    return 1;
  }
  else {
    return 0;
  }
}



