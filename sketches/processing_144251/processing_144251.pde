
/////////////////////////// //<>//
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
//
// Based on:
// #3 – A bit more than full
// http://geometrydaily.tumblr.com/post/15235118349/3-a-bit-more-than-full-a-new-minimal
//
// Controls:
// MouseClick  - redraw 
//
/////////////////////////////////////////////////

int sz = 700;
int bigDiam;
int smalDiam;
int bigPosX;
int smallPosX;
int bigPosY;
int smallPosY;

void setup() {
  size(sz, sz);
  noStroke();
  noLoop();
}

void draw() {
  background(235);
  fill(#b1c0bd);
  rect(100,100,sz-200,sz-200);
  bitFull(100, 400);
  paper(30);
}

void mousePressed() { redraw(); }
void keyPressed()   { redraw(); }

void paper(int in_val) {
  noStroke();
  for (int i = 0; i<width-1; i+=2) {
    for (int j = 0; j<height-1; j+=2) {
      fill(random(235-40, 235+30), in_val);
      rect(i, j, 2, 2);
    }
  }

  for (int i = 0; i<30; i++) {
    fill(random(60, 170), random(in_val*2.5, in_val*3));
    rect(random(0, width-2), random(0, height-2), random(1, 3), random(1, 3));
  }
}

void bitFull(int in_smin, int in_smax) {
  bigDiam = (int)random(in_smin, in_smax);
  bigPosX = (int)random(bigDiam/2+100, sz-bigDiam/2-100);
  bigPosY = (int)random(bigDiam/2+100, sz-bigDiam/2-100);
  smalDiam =(int)random(bigDiam*.8, bigDiam-bigDiam/10);
  smallPosY = (bigDiam-smalDiam)/2;
  
  pushMatrix();
  translate(bigPosX, bigPosY);
  rotate(random(TWO_PI));

  fill(230, 200, 0);  fill(110, 20, 35);
  arc(0, 0, bigDiam, bigDiam, HALF_PI, PI+HALF_PI);
  arc(-.5, smallPosY, smalDiam, smalDiam, PI+HALF_PI, TWO_PI+HALF_PI);
  fill(200, 160, 10); fill(40, 10, 10);
  arc(-.5, smallPosY, smalDiam, smalDiam, random(radians(240), radians(267)), PI+HALF_PI);
  popMatrix();
}
