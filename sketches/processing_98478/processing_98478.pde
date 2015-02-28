
float c_t;

float e1_x;
float e1_y;
float e2_x;
float e2_y;
int e_r = 10;
float e_t1;
float e_t2;

void setup() {
  size(200, 200);
  background(255);
  smooth();

  rectMode(CENTER);
}

void draw() {
  background(255);

  circle();
  network();
  packet();
}

void circle() {
  strokeWeight(10);
  stroke(0);
  noFill();
  ellipse(width/2, height/2, 130, 130);

  noStroke();
  fill(255);
  for (int i = 0 ; i < 2; i++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(90*i)+c_t);
    rect(0, 0, 5, 150);
    popMatrix();
  }

  c_t += 0.0075;
}

void packet() {
  e1_x = 15 * cos(e_t1);
  e1_y = 50 * sin(e_t1);

  e2_x = 15 * cos(e_t2+PI);
  e2_y = 50 * sin(e_t2+PI);

  fill(0);
  noStroke();

  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(-60));
  ellipse(e1_x, e1_y, e_r, e_r);
  ellipse(e2_x, e2_y, e_r, e_r);
  popMatrix();

  e_t1 += 0.03;
  e_t2 += 0.03;
}

void network() {
  noFill();
  stroke(0);
  strokeWeight(2);
  for (int i = -1 ; i <= 1; i++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(60*i));
    ellipse(0, 0, 30, 100);
    popMatrix();
  }
}



