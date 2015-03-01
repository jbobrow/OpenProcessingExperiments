
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: kim sunmin
// ID: 201420066

import ddf.minim.*;

Minim minim;
AudioInput input;

float x;
float y;

boolean onOff = true;
boolean Colors = true;

void setup () {
  size (600, 600);
  smooth();
  colorMode(RGB, 300);
 // minim = new Minim (this);
// input = minim.getLineIn (Minim.MONO, 512);
  stroke(#867e73);
}

void draw () {
  background (#f9f8da, 30);
  noStroke();
  rectMode(CENTER);
  rect(0, 0, width, height);
  noFill();
 // float dia = input.mix.level() * 1000;
  stroke(0, 200, dia);
  strokeWeight(5);
  println (dia);
  for (float a = 50; a <=width; a = a + 165) {
    for (float b = 50; b <=height; b = b + 200) {
      ellipse(a, b, dia, dia);
      ellipse(a, b, dia/2, dia/2);
    }
  }
  for (float a = 130; a <=width; a = a + 165) {
    for (float b = 150; b <=height; b = b + 200) {
      ellipse(a, b, dia, dia);
      ellipse(a, b, dia/2, dia/2);
    }
  }
}
