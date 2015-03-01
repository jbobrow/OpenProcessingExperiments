
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: PARK Jeungeun
// ID: 201420080


import ddf.minim.*;

Minim minim;
AudioInput input;

float p;

void setup() {
  size(600, 600, P3D);
  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
}

void draw() {

  float mic = input.mix.level() * 500;
  p = p*0.9 + mic*0.8;

  background(255, 255, 255);
  lights();

  noStroke();
  fill(#FC128F);
  pushMatrix();
  translate(1*width/2, height/2, -600);
  rotateX(radians(p));
  //rotateY(-radians(p));
  box(300, 300, 300);
  popMatrix();





  float dia = dist (mouseX, mouseY, pmouseX, pmouseY);

  ellipse(mouseX, mouseY, dia, dia);
}

