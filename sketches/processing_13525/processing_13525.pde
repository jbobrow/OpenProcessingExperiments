
float c;
float v;
float pc;
float pv;
float easing = 0.05;


void setup() {
  size (1000, 500);
  smooth();
}

void draw() {
  frameRate(60);
  float targetC = mouseX;
  c += (targetC - c) * easing;
  float targetV = mouseY;
  v += (targetV - v) * easing;
  background(169, 16, pv);
  pc = c;
  pv = v;
  
  randomSeed(0);
  stroke(0);
  strokeWeight(2);
  for (int n = 10; n < 500; n += 10) {
    for (int m = 10; m < 1000; m += 10) {
      point(m, n);
    }
  }
  
  translate(25, -25);
  man(560, 150, 90, 2.0);
  man(5, 100, 120, 5.0);
  man(300, 20, 200, 2.0);
  //man(700, 0, 150, 1.2);
  man(-60, 30, 180, 3.0);
}

void man(int x, int y, int g, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);
  noStroke();
  
  fill(245);
  // left wing
  triangle(13, 84, 73, 74, 73, 102);
  // right wing
  triangle(187, 86, 125, 71, 127, 102);
  
  fill(g);
  //left leg
  quad(81, 113, 89, 112, 89, 148, 81, 147);
  // right leg
  quad(104, 112, 112, 111, 112, 147, 104, 146);
  // body
  quad(71, 61, 128, 51, 128, 111, 71, 114);
  fill(220);
  // left eye
  quad(81, 68, 91, 67, 91, 70, 81, 71);
  // right eye
  quad(95, 65, 110, 63, 110, 67, 95, 69);
  // nose
  quad(92, 73, 94, 72, 94, 85, 92, 85);
  // mouth
  ellipse(93, 100, 10, 6);
  popMatrix();
}
  
  

