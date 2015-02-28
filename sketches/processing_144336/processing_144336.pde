
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
// #37 Son of Ra
// http://geometrydaily.tumblr.com/post/17155048079/37-son-of-ra-a-new-minimal-geometric
//
// Controls:
// MouseClick  - redraw 
//
// Keys:
// X  - add one strip
// Z - remove one strip 
//
/////////////////////////////////////////////////

int sw = 2;           
int sz = 600;
float diam = 600/1.8;
float start;
int iter = 8;
float step = diam/iter;
int [] ch = { -1, 1 };
int wdt = 65;

void setup() {
  size(sz, sz);
  colorMode(HSB, 100, 100, 100);
  noLoop();
  rectMode(CENTER);
  noStroke();
}

void draw() {
  background(10, 3, 90);
  start = diam + diam/2; 

  float H = random(0, 100);
  float S = random(90, 100);
  float B = 10;

  for (int i = 0; i<iter; ++i) {
    pushMatrix();
    translate(width/2, start-wdt/2);
    rotate(radians(random(7, 22)* ch[(int)random(ch.length)]));
    fill (H, S-i*(100/iter), B+i*((100-8)/iter));
    rect(0, 0, sz, wdt);
    start-= step - random(-step/2, step/2);
    popMatrix();
  }

  stroke(10, 3, 90);
  noFill();
  strokeWeight(300);
  ellipse(width/2-7, height/2, (diam+sz/2), (diam+sz/2));

  paper(10);  // browser value
  //paper(30);  // normal value
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
  iter = constrain(iter, 3, 30);
  step = diam/iter;
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
