

// Konkuk University 
// Department of Dynamic Media 
// SOS iDesign 
// Name: KIM Sunhyun 
// ID: 201420067 

import ddf.minim.*;
Minim minim;
AudioInput input;

float P;
float xoff;

void setup() {
  ortho();
  size(600, 600, P3D);
  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
}
void draw() {

  background(#93F2D0);
  float mic = input.mix.level() * 1000;
  P = P*0.90 + mic*0.8;
  camera(mouseX, mouseY, 250, 100, 150, 100, pmouseX, mouseX, mouseY);
  strokeWeight(7);
  stroke(mouseX-200);
  box(100);

  noStroke();
  for (int i=20; i<width; i+=250) {
    for (int j=0; j<height; j+=70) {
      xoff += 0.002;
      float n = noise(xoff)*500;

      pushMatrix();
      translate(i, j-50, -100);
      //rotateX(radians(P));
      //rotateY(-radians(P));
      rotate(radians(100));
      box(10, 20, -n);
      popMatrix();
    }
  }
}

