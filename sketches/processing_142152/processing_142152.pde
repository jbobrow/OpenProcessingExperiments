
float theta = 0;
float w2, h2;
int alph1 = 0;
int alph2 = 255;
int sides1 = 7;
int sides2 = 6;
int sides3 = 5;
int sides4 = 4;
int sides5 = 3;
int r1 = 220;
int r2 = 180;
int r3 = 140;
int r4 = 100;
int r5 = 60;

void setup() {
  size(600, 600);
  rectMode(CENTER);
  colorMode(HSB);
  noFill();
  strokeWeight(3);
  w2 = width/2;
  h2 = height/2;
}

void draw() {
  //  noStroke();
  //  fill(0, 0, 0, 80);
  //  rect(w2, h2, width, height);
  background(0, 0, 0);

  translate(w2, h2);

  rotate(radians(theta));
  stroke(0, 255, 255, alph2);
  fill(0, 255, 255, alph1);
  polygon(sides1, r1);
  polygon(sides2, r2);
  polygon(sides3, r3);
  polygon(sides4, r4);
  polygon(sides5, r5);

  rotate(radians(theta));
  stroke(25, 255, 255, alph2);
  fill(25, 255, 255, alph1);
  polygon(sides1, r1);
  polygon(sides2, r2);
  polygon(sides3, r3);
  polygon(sides4, r4);
  polygon(sides5, r5);

  rotate(radians(theta));
  stroke(44, 255, 255, alph2);
  fill(44, 255, 255, alph1);
  polygon(sides1, r1);
  polygon(sides2, r2);
  polygon(sides3, r3);
  polygon(sides4, r4);
  polygon(sides5, r5);

  rotate(radians(theta));
  stroke(76, 255, 255, alph2);
  fill(76, 255, 255, alph1);
  polygon(sides1, r1);
  polygon(sides2, r2);
  polygon(sides3, r3);
  polygon(sides4, r4);
  polygon(sides5, r5);

  rotate(radians(theta));
  stroke(153, 255, 255, alph2);
  fill(153, 255, 255, alph1);
  polygon(sides1, r1);
  polygon(sides2, r2);
  polygon(sides3, r3);
  polygon(sides4, r4);
  polygon(sides5, r5);

  rotate(radians(theta));
  stroke(195, 255, 255, alph2);
  fill(195, 255, 255, alph1);
  polygon(sides1, r1);
  polygon(sides2, r2);
  polygon(sides3, r3);
  polygon(sides4, r4);
  polygon(sides5, r5);

  theta+=.4;
}

void polygon(int sideCount, float radius) {

  float theta = 0;
  float x = 0;
  float y = 0;

  beginShape();
  for (int i=0; i<sideCount; i++) {
    x = cos(theta)*radius;
    y = sin(theta)*radius;
    vertex(x, y);
    theta += TWO_PI/sideCount;
  }
  endShape(CLOSE);
}


