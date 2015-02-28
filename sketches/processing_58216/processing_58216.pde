
float x;
float y;
float theta;

float spdx;
float spdy;

float alp = 255;

float spdx_r;
float spdy_r;

float mgn = 1;

int cflg;

void setup() {
  size(350, 500);
  background(0);
  smooth();
}

void draw() {
  color ylw = color(255, 255, random(255));
  color ble = color(random(255), 255, 255);

  fill(0, 10);
  noStroke();
  rect(0, 0, width, height);

  if (mousePressed == true) {

    if (cflg % 2 == 0) {
      fill(ylw);
    }
    else {
      fill(ble);
    }
    noStroke();
    x = mouseX + spdx;
    y = mouseY + spdy;

    pushMatrix();
    translate(x, y);
    rotate(theta);
    drawStar(0, 0, 1.5);
    popMatrix();
  }
  else {
    spdx = 0;
    spdy = 0;

    spdy_r = 1;
  }

  theta += 0.1;
}

void keyPressed() {
  println(cflg);
  cflg++;
}

void drawStar(float x, float y, float mgn) {
  beginShape();
  vertex(x, y - 20*mgn);
  vertex(x - 12*mgn, y + 15*mgn);
  vertex(x + 18*mgn, y -  8*mgn);
  vertex(x - 18*mgn, y -  8*mgn);
  vertex(x + 12*mgn, y + 15*mgn);
  endShape(CLOSE);
}


