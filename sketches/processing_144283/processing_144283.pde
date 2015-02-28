
/////////////////////////// //<>// 
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
//
// browser version
// Don't use without permission
//
// Based on:
// #251 Palantír
// http://geometrydaily.tumblr.com/post/31056374678/251-palantir-a-new-minimal-geometric
//
// Keys:
// UP  - add one ring.
// DOWN - remove one ring 
//
/////////////////////////////////////////////////

int sw = 2;           
int sz = 600;
float diam = 600/1.8;
int iter = 7;
float C = PI*diam;
int bgColor = 235;

void setup() {
  size(sz, sz);
  colorMode(HSB, 100, 100, 100);
  noLoop();
}

void draw() {
  background(0, 0, 90);
  noFill();

  pushMatrix();
  translate(width/2, height/2);
  rotate(random(radians(-10), radians(35)));
  for (int i = 0; i<iter; ++i) {
    strokeWeight(random (diam/9, diam/5));
    stroke(random(0, 100), random(80, 100), random(20, 80), 50);  // browser value
    //stroke(random(0, 100), random(80, 100), random(20, 80), 130);   // normal value
    ellipse(random(-diam/5, diam/5), random(diam/7, diam/5), diam+20, diam+20);
  }
  popMatrix();

  stroke(0, 0, 90);
  noFill();
  strokeWeight(300);
  ellipse(width/2-7, height/2, (diam+sz/2), (diam+sz/2));

  paper(10);  // browser value
  // paper(30);  // normal value
}

void mousePressed() {
  redraw();
}

void keyPressed() {
  if (key == 'z') {
    iter--;
  }
  if (key == 'x') {
    iter++;
  }
  iter = constrain(iter, 5, 30);
  redraw();
}

void paper(int in_val) {
  noStroke();
  for (int i = 0; i<width-1; i+=2) {
    for (int j = 0; j<height-1; j+=2) {
      fill(random(85-10, 85+10), in_val);
      rect(i, j, 2, 2);
    }
  }

  for (int i = 0; i<30; i++) {
    fill(random(40, 60), random(in_val*2.5, in_val*3));
    rect(random(0, width-2), random(0, height-2), random(1, 3), random(1, 3));
  }
}
