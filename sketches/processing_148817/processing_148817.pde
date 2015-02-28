
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Sunhyun
// ID: 201420067

import ddf.minim.*;

Minim minim;
AudioPlayer song;

float x = 0;
float y = 0;

void setup () {
  size (1024, 760);
  noStroke ();

  minim = new Minim (this);
  song = minim.loadFile("&Design.mp3");
  song.play ();
}

void draw () {
  fill (35, 54, 60, 30);
  rectMode (CORNER);
  rect (0, 0, width, height);

  float dimension = song.mix.level() * 250;
  for (int i = 0; i < 1024; i = i +73) {
    for (int j = 0; j < 768; j = j +130) {


      fill(#AFE6FF);
      strokeWeight (15);      
      rect(i, j, 130, dimension);

      fill(#74AAFF);  
      stroke(255);
      strokeWeight(5);
      rect(i, j, dimension, 50);

      stroke(255);
      fill(#74AAFF);
      strokeWeight(1);
      ellipse(i-60, j-13, 13, 13);

      fill(255);
      ellipse(i, j+50, 50, 50);
    }
  }
}

