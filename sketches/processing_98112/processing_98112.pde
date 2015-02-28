
float t;

void setup() {
  size(530, 300);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();
  strokeCap(SQUARE);
  rectMode(CENTER);
}

void draw() {
  background(360);

  perfect_gear(150, 150, 1);
  perfect_gear(380, 150, -1);
}

void perfect_gear(float x, float y, int sign) {
  pushMatrix();
  translate(x, y);

  noFill();
  strokeWeight(30);

  gear(220, 1, sign);
  gear(160, -1, sign);

  stroke(0);
  ellipse(0, 0, 180, 180);
  strokeWeight(10);
  ellipse(0, 0, 100, 100);
  for (int i = 0 ; i < 4; i++) {
    pushMatrix();
    translate(0,0);
    rotate(radians(45*i));
    rect(0, 0, 1, 90);
    popMatrix();
  }
  strokeWeight(5);
  ellipse(0, 0, 50, 50);
  popMatrix();

  t+=0.005;
}

void gear(int gear_size, int sign, int perfect_sign) {
  pushMatrix();
  translate(0, 0);
  rotate(perfect_sign*sign*t);
  for (int i = 0 ; i < 20; i++) {
    if (i % 2 == 0) {
      stroke(0);
    }
    else {
      noStroke();
    }
    arc(0, 0, gear_size, gear_size, radians((i+1)*18), radians((i+2)*18) );
  }


  popMatrix();
}



