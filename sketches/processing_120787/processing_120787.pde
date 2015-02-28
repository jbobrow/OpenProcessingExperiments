
float S = 0.5;

float num = 30;
float R = 100 * S;
float w = 10 * S;
float h = 20 * S;

float circle_R;

void setup() {
  size(900, 500);
  background(255);
  smooth();

  noLoop();
}



void draw() {
  noStroke();
  fill(103, 167, 255);
  rect(0, 0, width/2, height);

  fill(239, 103, 255);
  rect(width/2, 0, width/2, height);

  noFill();
  stroke(255);
  for (int i = 1; i < 7; i++) {
    for (int j = 1 ;   j < 7;j++) {
      lace(i*R+R, j*R+R*3/2);
    }
  }

  for (int p = 0; p < 3;p++) {
    if (p == 0) {
      circle_R = R * 3;
    }
    else if (p == 1) {
      circle_R = R * 2;
    }
    else {
      circle_R = R;
    }
    for (int q = 0; q < 12;q++) {
      pushMatrix();
      translate(width*3/4+circle_R*cos(radians(360*q/12)), 250+circle_R*sin(radians(360*q/12)));
      lace(0, 0);
      popMatrix();
    }
  }
}

void lace(float x, float y) {
  pushMatrix();
  translate(x, y);
  for (int i = 0; i < num;i++) {
    pushMatrix();
    translate(R*cos(radians(360*i/num)), R*sin(radians(360*i/num)));
    rotate(radians(360*i/num));
    ellipse(0, 0, w, h);
    popMatrix();
  }
  popMatrix();
}



