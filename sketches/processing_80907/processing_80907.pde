
//   Sketch written from scratch with help from the 
//   processing motion PDF on the wikispace, and
//   special thanks to Yanchao Hao.

PImage img1;
float y = -5;
float y1 = -5;
float y2 = -5;
float y3 = -5;
float y4 = -5;
float r = random (20,40);
float r1 = random (20,40);
float r2 = random (20,40);
float r3 = random (20,40);
float r4 = random (20,40);
float x = random (10,590);
float x1 = random (10,590);
float x2 = random (10,590);
float x3 = random (10,590);
float x4 = random (10,590);
float w = 397-y;

void setup() {
  size(600,397);
  smooth();
  noStroke();
  frameRate(60);
  img1 = loadImage("leaves.jpg");
}

void draw() {
  tint(150);
  image(img1,0,0);
  w = 397 - y;
  fill (70,99,69,w);
  ellipse(x,y,r,r);
  w = 397 - y1;
  fill (226,187,109,w);
  ellipse(x1,y1,r1,r1);
  w = 397 - y2;
  fill (95,44,17,w);
  ellipse(x2,y2,r2,r2);
  w = 397 - y3;
  fill (226,187,109,w);
  ellipse(x3,y3,r3,r3);
  w = 397 - y4;
  fill (70,99,69,w);
  ellipse(x4,y4,r4,r4);
 y += 2;
 y1 += 3;
 y2 += 6;
 y3 += 4;
 y4 += 7;
 if (y > 397) {
   y = -5;
   x = random(10,590);
 }
 if (y1 > 397) {
   y1 = -5;
   x1 = random(10,590);
 }
 if (y2 > 397) {
   y2 = -5;
   x2 = random(10,590);
 }
 if (y3 > 397) {
   y3 = -5;
   x3 = random(10,590);
 }
 if (y4 > 397) {
   y4 = -5;
   x4 = random(10,590);
 }
}

