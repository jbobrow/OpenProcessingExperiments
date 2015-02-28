
/*
Shim Sang Joon
 201420086
 */

float xW = 120;
float yW = 10;
float angle;

void setup() {
  size(600, 600);
  background(#32AF9D);
}

void draw() {
  translate(width/2, height/2);

  for (int j = 80; j<width; j += 80) {
    for (int i = 80; i<height; i += 80) {
      rotate(angle);
      scale(1);

      //ellipses
      fill(#F01B6C, 20);
      rect(i, j, xW, xW);
      ellipse(i, j, xW+40, xW+40);
      ellipse(i, j, xW+20, xW+20);
      ellipse(i, j, xW-20, xW-20);
      ellipse(i, j, xW-40, xW-40);
      ellipse(i, j, xW-30, xW-30);
      ellipse(i, j, xW+30, xW+30);
      scale(0.65);
      angle += 0.0002;
    }
  }
}

