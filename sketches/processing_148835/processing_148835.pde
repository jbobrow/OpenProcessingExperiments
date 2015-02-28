
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Youngji
// ID : 201420069

import ddf.minim.*;

Minim minim;
 AudioInput input;

float x;
 float y;

void setup () {
 size (displayWidth, displayHeight);
 smooth();

x = 0;
 y = 40;

minim = new Minim (this);
 input = minim.getLineIn (Minim.MONO, 512);
 }

void draw () {
    background(0);
 stroke (255);
 noFill ();
 
  float d = input.mix.level() * 1000;

  x += input.mix.level() * 100;
  
  for (int a = 20; a < width; a = a + 100) {  
    for (int b = 20; b < height; b = b + 100) {  
      noStroke();  
      fill(255, 167, 167, 100); 
      ellipse(a, b, d, d);  
      fill(255, 167, 167, 50);  
      rect(a+15, b+15, 70, 70);
    }
  }  
}
