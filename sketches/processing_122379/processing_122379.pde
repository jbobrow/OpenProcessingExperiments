
int timer;
float m;
int z = 255;
int n = 0;
int y;

void setup() {
  size(300, 300);
  frameRate(60);
  background(255);
  smooth();
  noCursor();
}

void draw() {
  background(z);
  scale(0.6, 0.6);
  noFill();
  strokeWeight(2);
  stroke(n);
  translate(0, -35);
  translate(m, 0);
  beginShape();
  vertex(120, 276);
  bezierVertex(123, 244, 143, 210, 224, 198);
  bezierVertex(305, 186, 359, 177, 378, 164);
  bezierVertex(396, 151, 403, 164, 400, 173);
  bezierVertex(396, 183, 309, 364, 247, 382);
  bezierVertex(185, 400, 112, 379, 120, 276);
  endShape(CLOSE);
  beginShape();
  bezier(235, 299, 230, 304, 222, 305, 218, 300);
  bezier(218, 300, 213, 296, 213, 288, 218, 283);
  bezier(218, 283, 223, 277, 231, 277, 236, 281);
  bezier(236, 281, 241, 286, 240, 294, 235, 299);
  endShape(CLOSE);
  beginShape();
  vertex(144, 277);
  bezierVertex(139, 282, 131, 283, 126, 278);
  bezierVertex(121, 274, 121, 266, 126, 260);
  bezierVertex(131, 255, 139, 254, 144, 259);
  bezierVertex(149, 263, 149, 271, 144, 277);
  endShape(CLOSE);
  beginShape();
  vertex(211, 253); 
  bezierVertex(221, 244, 238, 247, 249, 259);
  endShape();
  beginShape();
  vertex(138, 234);
  bezierVertex(147, 234, 157, 239, 163, 248);
  endShape();
  line(159, 309, 175, 342);
  line(155, 333, 179, 317);
}


void mouseMoved() {
  z = 0;
  n = 255;
  m =   random(-10, 20);
}

