
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Song Youngjun
// ID: 201420083

import ddf.minim.*;

Minim minim;
AudioInput input;

float angle;
float dia;
float x;
float y;

void setup () {
  size (600, 600, P3D);
  smooth();
  x = 0;
  colorMode(RGB, 700);
  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
}

void draw () {
  title();
  translate(width/2, height/2);
  fill (0, 30);
  rectMode(CENTER);
  rect(0, 0, width, height);
  stroke (0, 420, dia);
  noFill ();
  angle += 0.001;
  float d = input.mix.level() * 1000;
  dia = dia*0.9+d*0.9;
  x += input.mix.level() * 100;
  println(dia);

  for (int i=0; i<=360; i = i + 30) {
    //rotate(radians(45));
    rotateX(radians(dia));
    rotateY(radians(dia));
    rotateZ(radians(dia));
    //strokeWeight(0.01);
    //sphere(dia/3);
    box(100+(dia/3));
    //ellipse (0, 0, dia/2, dia/2);
    if (x > width) {
      x = 0;
    }
  }
}

void title() { 
  fill(255);
  textAlign(RIGHT);
  text("Song YoungJun, Rotating cube, Dynamic Media, 2014", width-50, height-20);
}

