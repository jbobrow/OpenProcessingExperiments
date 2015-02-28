
//   Sketch written from scratch with help from the 
//   processing motion PDF on the wikispace, and
//   special thanks to Yanchao Hao.

PImage img1;
float y = 200;
float y1 = 200;
float y2 = 200;
float y3 = 200;
float y4 = 200;
float y5 = 200;
float y6 = 200;
float y7 = 200;
float r = random (20,40);
float r1 = random (20,40);
float r2 = random (20,40);
float r3 = random (20,40);
float r4 = random (20,40);
float r5 = random (20,40);
float r6 = random (20,40);
float r7 = random (20,40);
float x = random (70,170);
float x1 = random (70,170);
float x2 = random (70,170);
float x3 = random (70,170);
float x4 = random (70,170);
float x5 = random (70,170);
float x6 = random (70,170);
float x7 = random (70,170);
float w = 250 - y;

void setup() {
  size(600,397);
  smooth();
  noStroke();
  rectMode(CENTER);
  frameRate(60);
  img1 = loadImage("grate.jpg");
}

void draw() {
  tint(150);
  image(img1,0,0);
  w = 250 - y;
  fill (33,139,234,w);
  ellipse(x,y,r,r);
  w = 250 - y1;
  fill (117,24,237,w);
  ellipse(x1,y1,r1,r1);
  w = 250 - y2;
  fill (67,13,153,w);
  ellipse(x2,y2,r2,r2);
  w = 250 - y3;
  fill (12,77,117,w);
  ellipse(x3,y3,r3,r3);
  w = 250 - y4;
  fill (33,139,234,w);
  rect(x4,y4,r4,r4);
  w = 250 - y5;
  fill (117,24,237,w);
  rect(x5,y5,r5,r5);
  fill (67,13,153,w);
  rect(x6,y6,r6,r6);
  w = 250 - y6;
  fill (12,77,117,w);
  rect(x7,y7,r7,r7);
 y -= random (1,7);
 y1 -= random (2,8);
 y2 -= random (1,6);
 y3 -= random (1,8);
 y4 -= random (3,8);
 y5 -= random (3,7);
 y6 -= random (3,6);
 y7 -= random (2,7);
 if (y < 0) {
   y = 200;
   x = random(70,170);
 }
 if (y1 < -20) {
   y1 = 200;
   x1 = random(70,170);
 }
 if (y2 < -20) {
   y2 = 200;
   x2 = random(70,170);
 }
 if (y3 < -20) {
   y3 = 200;
   x3 = random(70,170);
 }
 if (y4 < -20) {
   y4 = 200;
   x4 = random(70,170);
 }
 if (y5 < -20) {
   y5 = 200;
   x5 = random(70,170);
 }
 if (y6 < -20) {
   y6 = 200;
   x6 = random(70,170);
 }
 if (y7 < -20) {
   y7 = 200;
   x7 = random(70,170);
 }
}

