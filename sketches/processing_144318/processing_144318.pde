
/////////////////////////// //<>//
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
//
// Don't use without permission
//
// Based on:
// #103 Spark
// http://geometrydaily.tumblr.com/post/20963531376/103-spark-a-new-minimal-geometric-composition
//
// Controls:
// LeftMouseClick   - new Spark 
// RightMouseClick  - add new Spark 
//
// Keys:
// Z    - new Spark in random place
// X    - add new Spark in random place
//
/////////////////////////////////////////////////

int sz = 700;

void setup() {
  size(sz, sz);
  smooth();
  noLoop();
  oneSpark(random(100, sz-200), random(100, sz-200), (int)random(100, 400));
}

void draw() {
}

void oneSpark (float inX, float inY, int inD) {
  fill(#18312F);
  background(235);
  rect(100, 100, sz-200, sz-200);
  paper(15);
  spark(inX, inY, inD, inD);
  redraw();
}

void addOneSpark (float inX, float inY, int inD) {
  spark(inX, inY, inD, inD);
  redraw();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    oneSpark (mouseX, mouseY, (int)random(100, 400));
  }
  if (mouseButton == RIGHT) {
    addOneSpark (mouseX, mouseY, (int)random(100, 400));
  }
}

void keyPressed() {
  if (key == 'x') {
    addOneSpark (random(100, sz-100), random(100, sz-100), (int)random(100, 400));
  } else if (key == 'z')  {
    oneSpark (random(100, sz-100), random(100, sz-100), (int)random(100, 400));
  }
}

void paper(int in_val) {
  noStroke();
  for (int i = 0; i<width-1; i+=2) {
    for (int j = 0; j<height-1; j+=2) {
      fill(random(235-40, 235+30), in_val-2);
      rect(i, j, 2, 2);
    }
  }

  for (int i = 0; i<30; i++) {
    fill(random(30, 170), random(in_val*2.5, in_val*5));
    rect(random(0, width-2), random(0, height-2), random(1, 3), random(1, 3));
  }
}

void spark(float cx, float cy, int maxRad, color clbg) {
  float angle = 0.0;
  int limit = (int)random(6, 20);

  for (int i =0; i < limit; ++i) {
    stroke(235, random(10, 230));
    float scalar = random(random(10, 20), random(maxRad/2, maxRad)); 
    float x = cx + cos(angle) * scalar;
    float y = cy + sin(angle) * scalar;
    line(cx, cy, x, y);
    angle = radians(random(360));
  }
}
