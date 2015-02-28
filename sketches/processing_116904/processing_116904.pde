
float r;


void setup() {
  size(1200, 400);
  smooth();
  r=random(0, 255);
  noLoop();
}

void draw() {
  background(200);




  //background(160,163,173);

  for (int i=60; i<width; i+=100) {
    perfume(i, 100, int(random(100, 150)), random(-5, 10));
  }
}



void perfume(float x, float y, float a, float b) {
  pushMatrix();
  translate(x, y);
  //  /fill(random(245), random(50), random(250));




  //size(453, 676);
  fill(90, random(255));
  stroke(255, a);
  rotate(b*0.3);

  quad(150, 511, 293, 510, 257, 567, 176, 566);
  quad(95, 454, 150, 511, 175, 565, 134, 555);
  quad(355, 469, 317, 555, 257, 567, 293, 510);
  quad(204, 499, 224, 491, 222, 511, 151, 511);
  triangle(224, 494, 291, 509, 222, 511);
  quad(95, 454, 224, 488, 203, 498, 150, 512);
  quad(355, 469, 293, 510, 229, 493, 241, 483);

  quad(168, 298, 222, 308, 221, 490, 95, 454);
  quad(222, 308, 221, 490, 355, 469, 284, 304);
  quad(220, 469, 246, 498, 225, 504, 204, 499);


  //top
  quad(224, 113, 224, 280, 181, 264, 140, 160);
  quad(224, 113, 305, 160, 268, 264, 224, 280);
  quad(170, 299, 197, 280, 256, 281, 284, 303);

  popMatrix();
}

void mousePressed () {
  redraw ();
  
}



