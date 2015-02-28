
color c1 = color(252, 175, 66);
color c2 = color(183, 197, 198);
color c3 = color(60);
color c4 = #C1272D;
color c5 = #22B573;
color c6 = #0071BC;

PImage txture;

float spacer;
float p, t, r, g, b;
float x1, x2;
float sr, sr2, tr, tr1, tr2, tr3;

void setup() {
  size(700, 400);
  smooth();
  noLoop();
  //frameRate(10);
  spacer = width*.15;
  p = 0;
  txture = loadImage("lines.png");
}

void draw() {
  background(50);
  image(txture, 0, 0);
  
  x1 = 330;
  x2 = 15;
  if (x1<width) {
    if (x2<width) {
      for (float i = 30; i<width; i+=spacer) {
        float p = random(0, 25);
        r = random(255);
        g = random(255);
        b = random(255); 
        BillyBoy(i, x1, 0, color(r, g, b), .25, 90);
        BillyBoy(i, x2, 0, color(r, g, b), .25, 90);
      }
    }
  }

  pushMatrix();
  translate(width/2, 90);
  //sr = random(.7, 1);
  //scale(sr,sr);
  t = random(100, 210);
  BillyBoy(0, 0, 0, c6, 1, t+50);
  fill(color(r, g, b), 200);
  thunder_eyes(-16, 60);
  popMatrix();

  pushMatrix();
  tr = random(50, 200);
  tr1 = random (100, 200);
  translate(tr, tr1);
  sr = random(.3, .5);
  scale(sr,sr);
  t = random(70, 150);
  BillyBoy(0, 0, 0, c5, 1, t);
  fill(r, 200);
  thunder_eyes(-16, 60);
  popMatrix();

  pushMatrix();
  tr2 = random(500, width-45);
  translate(tr2, tr1);
  scale(sr,sr);
  BillyBoy(0, 0, 0, c4, 1, t);
  fill(g, 200);
  thunder_eyes(-16, 60);
  popMatrix();
}

void thunder_eyes (float x, float y) {
  //thunderbolt
  beginShape();
  vertex(14, 139);
  vertex(22, 139);
  vertex(15, 151); 
  vertex(22, 151);
  vertex(4, 174);
  vertex(11, 157);
  vertex(6, 157);
  endShape(CLOSE);

  //eyes
  triangle(-18, 60, -12, 60, -15, 69);
  triangle(12, 60, 18, 60, 15, 69);
}

void BillyBoy (float x, float y, float s, color c, float sca, float trans) {
  //billyboy
  pushMatrix();
  translate(x, y);

  //changes position & scale
  pushMatrix();
  translate(s, s);
  scale(sca);

  //hat
  noStroke();
  fill(c, trans);
  float XELL = random(-5, 5);
  ellipse(XELL, 0, 10, 10);
  float XT2 = random(-18, -8);
  float XT3 = random(8, 18);
  triangle(XELL, 0, XT2, 38, XT3, 38);

  //head
  noFill();
  stroke(c, trans);
  strokeWeight(4);
  float y3 = random(10, 16);
  float y4 = random(55, 65);
  float y5 = random(70, 85);
  beginShape();
  vertex(-y3, 42);
  vertex(y3, 42);
  vertex(35, y4);
  vertex(35, 80);
  vertex(y3, 102);
  vertex(-y3, 102);
  vertex(-35, 80);
  vertex(-35, y4);
  endShape(CLOSE);

  //body
  float x3 = random(8, 18);
  float x4 = random(170, 180);
  float x5 = random(140, 150);
  beginShape();
  vertex(-x3, 120);
  vertex(x3, 120);
  vertex(32, x5);
  vertex(32, x4);
  vertex(x3, 200);
  vertex(-x3, 200);
  vertex(-32, x4);
  vertex(-32, x5);
  endShape(CLOSE);

  //neck
  noStroke();
  fill(c, trans);
  float XN = random(-25, -5);
  rect(XN, 107, 33, 9);

  //arms
  float ay = random(140, 150);
  rect(-46, ay, 11, 11);
  rect(36, ay, 11, 11);

  //feet
  float XFLeft = random(-20, -10);
  float XFRight = random(0, 10);
  rect(XFLeft, 205, 15, 10);
  rect (XFRight, 205, 15, 10);

  thunder_eyes(-16, 60); 

  //mouth
  float mouth = random(3, 10);
  float YM = random(80, 85);
  rect(-15, YM, 30, mouth); 

  //ears
  float YEleft = random(60, 70);
  float YEright = random(60, 70);
  rect(-45, YEleft, 6, 14);
  rect(39, YEright, 6, 14);

  //thunderbolt(14, 139);

  popMatrix();
  popMatrix();
}



void mousePressed() {
  redraw();
}


