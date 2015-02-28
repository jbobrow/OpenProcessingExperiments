
/*
 Konkuk University
 SOS iDesign
 
 Name: KIM Mirae
 ID: 201420064
 
 */

import ddf.minim.*;

Minim minim;
AudioInput input;

float x;
float y;

void setup () {
  size (600, 600);
  smooth();

  x = 0;
  y = 40;

  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
  background (255);
}

void draw () {

  stroke (255);
  noFill ();

  float dia = input.mix.level() * 1000;

  x += input.mix.level() * 100;


  stroke(0);
  for (int i = 10; i < width; i+=50) {
    for (int j = 10; j < height; j+=50) {
      ellipseMode(CENTER);
      noStroke();
      fill(#9ce77f);
      ellipse(i+15, j+15, dia, dia);
    }
  }

  stroke(0);
  for (int i = 10; i < width; i+=50) {
    for (int j = 10; j < height; j+=50) {
      ellipseMode(CENTER);
      noStroke();
      fill(#ffb400);
      ellipse(i+15, j+215, dia, dia);
    }
  }


  stroke(0);
  for (int i = 10; i < width; i+=50) {
    for (int j = 10; j < height; j+=50) {
      ellipseMode(CENTER);
      noStroke();
      fill(#0091bb);
      ellipse(i+15, j+415, dia, dia);
    }
  }

  stroke(0);
  for (int i = 10; i < width; i+=50) {
    for (int j = 10; j < height; j+=50) {
      ellipseMode(CENTER);
      noStroke();
      fill(#ffffff);
      ellipse(i+14, j+14, dia, dia);
    }
  }
}

