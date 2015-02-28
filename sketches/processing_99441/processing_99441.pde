
color lock_color = color(255, 0, 100);
color default_color = color(255, 255, 0);
color c = default_color;

float magn; //magnification、拡大率

float black_y = 0;

float bigcircle_w = 150;
float smallcircle_h = 135;

void setup() {
  size(300, 300);
  background(0);
  smooth();
  strokeCap(SQUARE);
  rectMode(CENTER);

  //noCursor();
}

void draw() {
  background(0);

  pushMatrix();
  translate(width/2, height/2);

  //color petals
  for (int i = 0 ; i < 8;i++) {
    pushMatrix();
    translate(0, 0);
    rotate(radians(360 * i /8));
    if (i % 2 == 0) {
      magn = 1;
    }
    else {
      magn = 0.7;
    }
    fill(c);
    petal(0, -35, magn);
    popMatrix();
  }



  //black petals
  for (int i = 0 ; i < 8;i++) {
    pushMatrix();
    translate(0, 0);
    rotate(radians(360 * i /8));
    if (i % 2 == 0) {
      magn = 1;
    }
    else {
      magn = 0.7;
    }
    fill(0);
    petal(0, -black_y, magn);

    popMatrix();
  }

  noFill();
  strokeWeight(5);
  stroke(c);
  ellipse(0, 0, bigcircle_w, 150);
  strokeWeight(2);
  ellipse(0, 0, 135, smallcircle_h);
  strokeWeight(5);
  ellipse(0, 0, 200, 200);
  strokeWeight(2);
  ellipse(0, 0, 220, 220);

  for (int i = 0; i < 2; i++) {
    pushMatrix();
    translate(0, 0);
    rotate(radians(90*i));
    noStroke();
    fill(c);
    rect(0, 0, 3, 40);
    popMatrix();
  }

  if (mousePressed == true) {
    black_y += 5;
    bigcircle_w -= 8;
    smallcircle_h -= 8;
    if (black_y > 80) {
      black_y = 80;
      c = lock_color;
    }
    if (bigcircle_w < 50) {
      bigcircle_w = 50;
    }
    if (smallcircle_h < 50) {
      smallcircle_h = 50;
    }
  }
  else {
    c = default_color;

    black_y -= 5;
    bigcircle_w += 8;
    smallcircle_h += 8;
    if (black_y < 0) {
      black_y = 0;
    }
    if (bigcircle_w > 150) {
      bigcircle_w = 150;
    }
    if (smallcircle_h > 135) {
      smallcircle_h = 135;
    }
  }
  popMatrix();
}

void petal(float x, float y, float magn) {
  for (int i = 1 ; i <=  10; i++) {
    noStroke();
    ellipse(x, y-6*i*magn, 5*i*magn, 7.5*i*magn);
  }
}



