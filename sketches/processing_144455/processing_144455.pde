
///////////////////////////
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
//
// Don't use without permission
//
// Based on:
// #3 – A bit more than full (interactive version)
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
int bit;
float angleB = 270;
float angleM = 90;
float angleS = 270;
float speed;
float spp = 0.03; 
float rot;
color [] elclr = new color [2];

void setup() {
  size(sz, sz);
  colorMode(HSB, 100, 100, 100);
  noStroke();
  bitFull(100, 400);
  frameRate(60);
}

void draw() {
  background(#E8E8E8);
  fill(#b1c0bd);
  rect(100, 100, sz-200, sz-200);


  if (angleB>90) {
    angleB-=speed;
  } 
  else if (angleM>-90 ) {
    angleM-=speed;
  } 
  else if (angleS> bit) {
    angleS-=speed;
  } 

  translate(bigPosX, bigPosY);
  rotate(rot);

  fill(elclr[0]);  //fill(110, 20, 35);
  arc(0, 0, bigDiam, bigDiam, radians(angleB), radians(270) );
  arc(-.5, smallPosY, smalDiam, smalDiam, radians(angleM), radians(90));
  fill(elclr[1]);
  arc(-.5, smallPosY, smalDiam, smalDiam, radians(angleS), radians(270));
}

void mousePressed() { 
  bitFull(100, 400); 
  redraw();
}
void keyPressed() { 
  bitFull(100, 400); 
  redraw();
}

void bitFull(int in_smin, int in_smax) {

  speed=3;
  angleB = 270;
  angleM = 90;
  angleS = 270;
  bit = (int)random(250, 268);
  rot = random(radians(360));
  float H = random(100);
  float S = random(50, 100);
  float B = random(50, 70);
  elclr[0] = color(H, S, B);
  elclr[1] = color(H, S, B-30);

  bigDiam = (int)random(in_smin, in_smax);
  bigPosX = (int)random(bigDiam/2+100, sz-bigDiam/2-100);
  bigPosY = (int)random(bigDiam/2+100, sz-bigDiam/2-100);
  smalDiam =(int)random(bigDiam*.85, bigDiam-bigDiam/10);
  smallPosY = (bigDiam-smalDiam)/2;
}
