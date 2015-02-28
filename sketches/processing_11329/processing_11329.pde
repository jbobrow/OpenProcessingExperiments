
void setup() {
  size(500, 500);
  colorMode(HSB, 100);
  background(10, 95, 90);
  smooth();
  noLoop();
}


void draw() {
  drawWave1(); //right
  drawWave2(); //center
  drawWave3(); //left
}


void drawWave1() {
  noStroke();
  fill(0, 85, 50);
  for(int i = 0; i < 7; i++) {
    beginShape();
    vertex(11 + i * 70, 0);
    bezierVertex(11 + i * 70, 0, 8 + i * 70, 24, 12 + i * 70, 46);
    bezierVertex(16 + i * 70, 68, 23 + i * 70, 88, 18 + i * 70, 109);
    bezierVertex(13 + i * 70, 130, 4 + i * 70, 154, 5 + i * 70, 181);
    bezierVertex(6 + i * 70, 208, 13 + i * 70, 220, 13 + i * 70, 231);
    bezierVertex(13 + i * 70, 242, 15 + i * 70, 262, 9 + i * 70, 295);
    bezierVertex(3 + i * 70, 328, 2 + i * 70, 337, 8 + i * 70, 366);
    bezierVertex(14 + i * 70, 395, 24 + i * 70, 413, 19 + i * 70, 440);
    bezierVertex(14 + i * 70, 467, 14 + i * 70, 499, 14 + i * 70, 500);
    bezierVertex(14 + i * 70, 500, 30 + i * 70, 500, 30 + i * 70, 500);
    bezierVertex(30 + i * 70, 500, 30 + i * 70, 506, 29 + i * 70, 480);
    bezierVertex(28 + i * 70, 454, 27 + i * 70, 452, 27 + i * 70, 439);
    bezierVertex(27 + i * 70, 426, 27 + i * 70, 404, 23 + i * 70, 389);
    bezierVertex(19 + i * 70, 374, 15 + i * 70, 349, 16 + i * 70, 326);
    bezierVertex(17 + i * 70, 303, 23 + i * 70, 289, 24 + i * 70, 272);
    bezierVertex(25 + i * 70, 255, 17 + i * 70, 212, 16 + i * 70, 200);
    bezierVertex(15 + i * 70, 188, 15 + i * 70, 179, 19 + i * 70, 155);
    bezierVertex(23 + i * 70, 131, 30 + i * 70, 114, 31 + i * 70, 98);
    bezierVertex(32 + i * 70, 82, 31 + i * 70, 52, 29 + i * 70, 40);
    bezierVertex(27 + i * 70, 28, 22 + i * 70, 0, 22 + i * 70, 0);
    endShape(CLOSE);
  }
}

void drawWave2() {
  noFill();
  strokeWeight(2);
  stroke(0, 85, 50);
  for(int i = 0; i < 14; i++) {
    beginShape();
    vertex(38 + i * 35, 0);
    bezierVertex(38 + i * 35, 0, 38 + i * 35, 0, 38 + i * 35, 0);
    bezierVertex(38 + i * 35, 0, 42 + i * 35, 54, 42 + i * 35, 77);
    bezierVertex(42 + i * 35, 100, 40 + i * 35, 114, 39 + i * 35, 139);
    bezierVertex(38 + i * 35, 164, 33 + i * 35, 218, 33 + i * 35, 240);
    bezierVertex(33 + i * 35, 262, 36 + i * 35, 261, 34 + i * 35, 300);
    bezierVertex(32 + i * 35, 339, 34 + i * 35, 354, 34 + i * 35, 375);
    bezierVertex(34 + i * 35, 396, 34 + i * 35, 397, 34 + i * 35, 426);
    bezierVertex(34 + i * 35, 455, 33 + i * 35, 500, 33 + i * 35, 500);
    endShape();
  }
}

void drawWave3() {
  noStroke();
  fill(0, 85, 50);
  for(int i = 0; i < 7; i++) {
    beginShape();
    vertex(53, 0);
    bezierVertex(53 + i * 70, 0, 53 + i * 70, 0, 53 + i * 70, 0);
    bezierVertex(53 + i * 70, 0, 49 + i * 70, 3, 46 + i * 70, 42);
    bezierVertex(43 + i * 70, 81, 48 + i * 70, 102, 48 + i * 70, 102);
    bezierVertex(48 + i * 70, 102, 57 + i * 70, 140, 52 + i * 70, 170);
    bezierVertex(47 + i * 70, 200, 37 + i * 70, 239, 39 + i * 70, 263);
    bezierVertex(41 + i * 70, 287, 50 + i * 70, 350, 50 + i * 70, 343);
    bezierVertex(50 + i * 70, 371, 44 + i * 70, 386, 43 + i * 70, 411);
    bezierVertex(42 + i * 70, 436, 43 + i * 70, 458, 43 + i * 70, 458);
    bezierVertex(43 + i * 70, 458, 45 + i * 70, 501, 45 + i * 70, 501);
    bezierVertex(45 + i * 70, 501, 60 + i * 70, 500, 60 + i * 70, 500);
    bezierVertex(60 + i * 70, 500, 52 + i * 70, 465, 52 + i * 70, 446);
    bezierVertex(52 + i * 70, 427, 47 + i * 70, 444, 53 + i * 70, 399);
    bezierVertex(59 + i * 70, 354, 64 + i * 70, 359, 61 + i * 70, 337);
    bezierVertex(58 + i * 70, 315, 57 + i * 70, 296, 53 + i * 70, 279);
    bezierVertex(49 + i * 70, 262, 48 + i * 70, 269, 49 + i * 70, 246);
    bezierVertex(50 + i * 70, 223, 62 + i * 70, 196, 63 + i * 70, 170);
    bezierVertex(64 + i * 70, 144, 70 + i * 70, 133, 64 + i * 70, 109);
    bezierVertex(58 + i * 70, 85, 54 + i * 70, 75, 56 + i * 70, 53);
    bezierVertex(58 + i * 70, 31, 66 + i * 70, 0, 66 + i * 70, 0);
    endShape(CLOSE);
  }
}

