
float t;

float bigarc_r = 200;
boolean lock_flg = false;

float bigcircle_r_goal = 180;
float smallcircle_r_goal = 50;

float bigcircle_r = 0;
float smallcircle_r = 0;

color lock_color = color(255, 0, 0);
color default_color = color(0, 255, 255);
color c = default_color;

boolean theta_flg = false;
boolean bigcircle_flg = false;
boolean smallcircle_flg = false;

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

  noFill();

  for (int i = 0 ;i < 20;i++) {
    if (i % 2 == 0) {
      stroke(c);
    }
    else {
      noStroke();
    }
    strokeWeight(10);
    arc(0, 0, 150, 150, radians((i)*18+9), radians((i+1)*18+9));

    strokeWeight(20);
    pushMatrix();
    translate(0, 0);
    rotate(radians(t));

    arc(0, 0, 150, 150, radians((i)*18+9), radians((i+1)*18+9));
    popMatrix();
  }
  stroke(c);
  strokeWeight(5);
  noFill();
  ellipse(0, 0, bigcircle_r, bigcircle_r);
  strokeWeight(2);
  ellipse(0, 0, smallcircle_r, smallcircle_r);

  for (int i = 0; i < 2; i++) {
    pushMatrix();
    translate(0, 0);
    rotate(radians(90*i));
    noStroke();
    fill(c);
    rect(0, 0, 3, 80);
    popMatrix();
  }

  //big arc
  strokeWeight(10);
  noFill();
  stroke(c);
  arc(0, 0, bigarc_r, bigarc_r, radians(-40), radians(40));
  arc(0, 0, bigarc_r, bigarc_r, radians(-40)+PI, radians(40)+PI);

  if (mousePressed == true) {
    t += 3;   
    bigcircle_r += 20;   
    smallcircle_r += 20;
    if (t > 18) {
      t = 18;
      theta_flg = true;
    }
    if (bigcircle_r > bigcircle_r_goal) {
      bigcircle_r = bigcircle_r_goal;
      bigcircle_flg = true;
    }
    if (smallcircle_r > smallcircle_r_goal) {
      smallcircle_r = smallcircle_r_goal;
      smallcircle_flg = true;
    }

    if (theta_flg && bigcircle_flg && smallcircle_flg) {
      c = lock_color;
    }
  }
  else {
    c = default_color;

    t -= 3;
    bigcircle_r -= 20;
    smallcircle_r -= 20;

    theta_flg = false;
    bigcircle_flg = false;
    smallcircle_flg = false;
    if (t < 0) {
      t = 0;
    }
    if (bigcircle_r < 0) {
      bigcircle_r = 0;
    }
    if (smallcircle_r < 0) {
      smallcircle_r = 0;
    }
  }

  popMatrix();
}

class Scope {
  PApplet papplet;

  float theta = 0;

  float bigarc_r = 200;
  boolean lock_flg = false;

  color lock_color = color(255, 0, 0);
  color default_color = color(0, 255, 255);
  color c;

  float x;
  float y;

  Scope(PApplet tmpP, float tmpX, float tmpY) {
  }

  void display() {
    pushMatrix();
  translate(width/2, height/2);

  noFill();

  for (int i = 0 ;i < 20;i++) {
    if (i % 2 == 0) {
      stroke(0, 255, 255);
    }
    else {
      noStroke();
    }
    strokeWeight(10);
    arc(0, 0, 150, 150, radians((i)*18+9), radians((i+1)*18+9));

    strokeWeight(25);
    pushMatrix();
    translate(0, 0);
    rotate(radians(t));
    if (mousePressed == true) {
      t += 0.1;      
      if (t > 18) {
        t = 18;
      }
    }
    else {
      t -= 0.1;
      if (t < 0) {
        t = 0;
      }
    }
    arc(0, 0, 145, 145, radians((i)*18+9), radians((i+1)*18+9));
    popMatrix();
  }
  stroke(0, 255, 255);
  strokeWeight(5);
  noFill();
  ellipse(0, 0, 180, 180);
  strokeWeight(2);
  ellipse(0, 0, 50, 50);

  for (int i = 0; i < 2; i++) {
    pushMatrix();
    translate(0, 0);
    rotate(radians(90*i));
    noStroke();
    fill(0, 255, 255);
    rect(0, 0, 3, 80);
    popMatrix();
  }

  //big arc
  strokeWeight(10);
  noFill();
  stroke(0, 255, 255);
  arc(0, 0, bigarc_r, bigarc_r, radians(-40), radians(40));
  arc(0, 0, bigarc_r, bigarc_r, radians(-40)+PI, radians(40)+PI);


  popMatrix();
  }

  void locking_scope() {
  }

  void default_scope() {
  }
}



