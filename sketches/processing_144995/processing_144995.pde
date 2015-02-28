
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Song Youngjun
// ID: 201420083

float x = 0;
float y = 0;
float xSpeed = 3.5;
float ySpeed = 2;
float angle;
float angleN = radians(0.1);

void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  background(#2a2829);
  //Rotate Stars
  for (int i = 25; i < width; i = i + 50) {
    for (int j = 25; j < height; j = j + 50) {
      pushMatrix();
      translate(i, j);
      rotate (angle);
      noStroke();
      fill(#aba8af, 50);
      scale(0.8);
      beginShape();
      vertex(0, -50);
      vertex(14, -20);
      vertex(47, -15);
      vertex(23, 7);
      vertex(29, 40);
      vertex(0, 25);
      vertex(-29, 40);
      vertex(-23, 7);
      vertex(-47, -15);
      vertex(-14, -20);
      endShape(CLOSE);
      popMatrix();
    }
    angle = angle + angleN;
  }
  if ((angle > radians(360)) || (angle < radians(0))) {
    angleN = angleN * -1;
  }

  x = x + xSpeed;
  y = y + ySpeed;

  if ((x > width) || (x < 0)) {
    xSpeed = xSpeed * -1;
  }

  if ((y > height) || (y < 0)) {
    ySpeed = ySpeed * -1;
  }

  //lines
  stroke(0);
  strokeWeight(5);
  fill(x, y, 0, 100);
  for (int a = 0; a<=600; a = a+50) {
    for (int b = 0; b<=600; b = b+50) {
      line(x, y, a, b);
    }
  }
  pushMatrix();
  translate(x, y);
  rotate (-angle);
  noStroke();
  fill(#aba8af);
  beginShape();
  vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);
  popMatrix();
}

