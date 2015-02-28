
float theta;
float r;

float bigarc_r = 200;
float bigarc_t;

boolean theta_flg = false;
boolean r_flg = false;
boolean bigarc_flg = false;

color lock_color = color(255, 0, 255);
color default_color = color(100, 0, 100);
color c = default_color;

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
  for (int i = 1 ; i <= 8; i++) {
    pushMatrix();
    translate(0, 0);
    rotate(radians(360 * i / 8));
    noStroke();
    fill(c);
    pushMatrix();
    translate(0, -80+r);
    rotate(radians(90-theta));
    ellipse(0, 0, 5, 100);
    popMatrix();
    popMatrix();
  }

  noFill();
  stroke(c);
  strokeWeight(3);
  ellipse(0, 0, 150, 150);
  strokeWeight(2);
  ellipse(0, 0, 100, 100);

  //big arc
  strokeWeight(10);
  noFill();
  pushMatrix();
  translate(0, 0);
  rotate(bigarc_t);
  arc(0, 0, bigarc_r, bigarc_r, radians(-40), radians(40));
  arc(0, 0, bigarc_r, bigarc_r, radians(-40)+PI, radians(40)+PI);
  popMatrix();
  pushMatrix();
  translate(0, 0);
  rotate(-bigarc_t);
  arc(0, 0, bigarc_r*1.2, bigarc_r*1.2, radians(-60+90), radians(60+90));
  arc(0, 0, bigarc_r*1.2, bigarc_r*1.2, radians(-60+90)+PI, radians(60+90)+PI);
  popMatrix();

  popMatrix();



  if (mousePressed == true) {
    theta += 2;
    r += 5;
    bigarc_t += 0.075;

    if (theta > 45) {
      theta = 45;
      theta_flg = true;
    }
    if (r > 50) {
      r = 50;
      r_flg = true;
    }
    if (bigarc_t > PI/2) {
      bigarc_t = PI/2;
      bigarc_flg = true;
    }
    if (theta_flg && r_flg && bigarc_flg) {
      c = lock_color;
    }
  }
  else {
    c = default_color;

    theta -= 1;
    r -= 5;
    bigarc_t -= 0.075;

    theta_flg = false;
    r_flg = false;
    bigarc_flg = false;

    if (theta < 0) {
      theta = 0;
    }
    if (r < 0) {
      r = 0;
    }
    if (bigarc_t < 0) {
      bigarc_t = 0;
    }
  }
}



