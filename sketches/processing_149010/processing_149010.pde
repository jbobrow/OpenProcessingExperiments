
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// CHOI Jihye
// 201420116

import ddf.minim.*;

Minim minim;
AudioInput input;

String A = "hungry" ;

String inputText = A;

float x;
float y;

void setup () {
  size (600, 600);
  smooth();
  frameRate (15);
  textSize(fontSize);  
  textAlign (LEFT, CENTER);


  x = 0;
  y = 40;

  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
}

void draw () {
  stroke (0);
  noFill ();

  float dia = input.mix.level() * 1000;

  x += input.mix.level() * 100;

  ellipse (x, y, dia, dia);

  if (x > width) {
    x = 0;
    y += 40;
  }
  if (y >height) {
    background(0);
    y = 40;
  }
}

