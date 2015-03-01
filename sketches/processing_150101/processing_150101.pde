
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: PARK Jeungeun
// ID: 201420080

import ddf.minim.*;

Minim minim;
AudioInput input;
//=====================================================
float a=1;
float x;

void setup() {
  size(displayWidth, displayHeight);
  smooth();
  //=====================================================
  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
  //=====================================================
}

void draw() {
  background(#FF1AA4);

  a = a+50;

  //cookie   

   noStroke();
  fill(#FCE24C);
  ellipse(a, height/2, 200, 200);
  
   noStroke();
  fill(#98840E);
  ellipse(a, height/2, 100, 100);
  
  
  //teeth
  fill(255);
  //=====================================================
  float dia = input.mix.level() * 1000;

  x += input.mix.level() * 100;
  //=====================================================
  for (int i = 5; i<=width; i+=100) {
    triangle(i+5, 0, i+185, 0, i+115, 300+dia);
  }
  for (int j = 80; j<=width; j+=100) {
    triangle(j-80, height, j+100, height, j-10, 468-dia);
  }

  if (a >width+1000) {
    a = 1;
  }
}

void title() {
  fill(0);
  textAlign(RIGHT);
  text("PARK Jeungeun, Cookie Monster, Dynamic Media, 2014", width-50, height-20);
}


