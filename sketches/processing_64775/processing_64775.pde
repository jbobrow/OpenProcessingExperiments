
int flg = 1;
int r = 35;
float theta;
float s;

void setup() {
  size(330, 330);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();
}

void draw() {
  background(360);
  translate(width/2, height/2);
  pushMatrix();

  rotate(theta);

  for (int j = 2;j>=1;j--) {
    for (int i = 0;i<8*j;i++) {
      fill(360 * i /(8*j), 100, 100, 100);
      ellipse(s*j*sin(radians(360 * i /(8*j))), s*j*cos(radians(360 * i /(8*j))), r, r);
    }
  }
  popMatrix();
  pushMatrix();
  rotate(-theta);
  for (int j = 3;j>=1;j--) {
    for (int i = 0;i<8*j;i++) {
      fill(360 * i /(8*j), 100, 100, 100);

      ellipse(s*j*0.5*sin(radians(360 * i /(8*j))), s*j*0.5*cos(radians(360 * i /(8*j))), r/2, r/2);
    }
  }

  ellipse(0, 0, r, r);
  popMatrix();

  theta += 0.01;

  if (flg == 1) {
    s++;
  }
  else {
    s--;
  }
  if (s > 70 || s < 0) {
    flg *= -1;
  }
}

