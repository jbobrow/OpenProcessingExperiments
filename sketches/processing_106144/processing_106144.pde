
float DY = 20;
float DX = DY * 0.5 * sqrt(3);

//color COLOR1 = #FF99CC;
//color COLOR2 = #99CCFF;
//color COLOR3 = #CCFF99;
color COLOR1 = #99CCFF;
color COLOR2 = #99CCFF;
color COLOR3 = #99CCFF;

/*
 u   v
  \ /
   |
   w
*/
void hexVertex(float u, float v, float w) {
  vertex((v - u) * DX, (w - 0.5 * (u + v)) * DY);
}

void hexTranslate(float u, float v, float w) {
  translate((v - u) * DX, (w - 0.5 * (u + v)) * DY);
}

void drawBlock(float a, float b, float c, color col) {
  float d = 0 - a;
  float e = 1 - b;
  float f = 2 - c;

  /*
     /|
    / /
   | |
   |/
  */
  fill(lerpColor(col, #000000, 0.667));
  beginShape();
  hexVertex(0, 0, 0);
  hexVertex(d, f, d);
  hexVertex(d, f, e);
  hexVertex(d, e, e);
  hexVertex(d, e, f);
  hexVertex(d, d, f);
  endShape(CLOSE);

  /*
   |\
    \ \
     | |
      \|
  */
  fill(lerpColor(col, #000000, 0.333));
  beginShape();
  hexVertex(0, 0, 0);
  hexVertex(d, d, f);
  hexVertex(e, d, f);
  hexVertex(e, d, e);
  hexVertex(f, d, e);
  hexVertex(f, d, d);
  endShape(CLOSE);

  /*
   /\/\
   \  /
    \/
  */
  fill(col);
  beginShape();
  hexVertex(0, 0, 0);
  hexVertex(f, d, d);
  hexVertex(f, e, d);
  hexVertex(e, e, d);
  hexVertex(e, f, d);
  hexVertex(d, f, d);
  endShape(CLOSE);
}

void setup() {
  size(400, 400);
}

void draw() {
  float t = millis() * 1e-3;
  float a = sin(t - 2 * THIRD_PI) / 3;
  float b = sin(t) / 3;
  float c = sin(t + 2 * THIRD_PI) / 3;
  noStroke();
  hexTranslate(t % 9, 0, 0);
  for (int i = 0; i < 3; i++) {
    pushMatrix();
    for (int j = 0; j < 6; j++) {
      pushMatrix();
      drawBlock(a, b, c, COLOR1);
      hexTranslate(-3, 0, 0);
      drawBlock(b, c, a, COLOR2);
      hexTranslate(0, -3, 0);
      drawBlock(c, a, b, COLOR3);
      hexTranslate(-3, 0, 0);
      drawBlock(a, b, c, COLOR1);
      hexTranslate(0, -3, 0);
      drawBlock(b, c, a, COLOR2);
      hexTranslate(-3, 0, 0);
      drawBlock(c, a, b, COLOR3);
      popMatrix();
      hexTranslate(-3, +3, 0);
    }
    popMatrix();
    hexTranslate(0, 0, 9);
  }
}
