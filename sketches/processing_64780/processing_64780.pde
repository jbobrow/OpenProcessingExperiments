
int flg = 1;
int r = 20;
float theta;
float s;
int shape_flg = 1;

void setup() {
  size(330, 330);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();
}

void draw() {
  noStroke();
  fill(360, 50);
  rect(0, 0, width, height);

  translate(width/2, height/2);
  pushMatrix();

  if (shape_flg ==1) {
    rotate(theta);
    for (int j = -2;j<3;j++) {
      for (int i = -2;i<3;i++) {
        fill(abs(i*j)*50, 100, 100, 100);
        ellipse(s*j, s*i, r, r);
      }
    }
  }
  else {
    rotate(-theta);
    for (int j = 2;j>=1;j--) {
      for (int i = 0;i<8*j;i++) {
        fill(360 * i /(8*j), 100, 100, 100);
        ellipse(s*1.5*j*sin(radians(360 * i /(8*j))), s*1.5*j*cos(radians(360 * i /(8*j))), r, r);
      }
    }
    ellipse(0, 0, r, r);
  }

  popMatrix();

  theta += 0.01;

  if (flg == 1) {
    s+=1;
  }
  else {
    s-=1;
  }
  if (s > 50 || s < 0) {
    flg *= -1;
  }
  if (s < 0) {
    shape_flg *= -1;
  }
}

