
int num = 6;
int s = 3;

int center_x = 250;
int center_y = 250;


void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  background(200);
  smooth();

  //noLoop();
  noStroke();
}

void draw() {
  background(200);

  for (int i = s;i>=3;i-=2) {
    fill(360 * i / s, 50, 100);
    flower(center_x, center_y, i);
    fill(360);
    flower(center_x, center_y, i-1);
  }
}
void flower(float x, float y, float s) {
  for (int j = 0 ; j <= num; j++) {
    pushMatrix();
    translate(x, y);
    rotate(radians((360/ num) * j));

    for (int i = 10; i > 0;i--) {
      ellipse(0, i*1.2*s, s*i+3, s*i+3);
    }
    popMatrix();
  }
}


void mousePressed() {
  if (mouseButton == LEFT) {
    s++;
  }
  else {
    num++;
  }
}

void keyPressed () {
  num = 6;
  s = 3;
}

