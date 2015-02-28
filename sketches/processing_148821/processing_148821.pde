
/* Konkuk University
 Department of Dynamic Media
 SOS iDesign
 Name: MinKyung Kim
 ID: 201420065 
 */

import ddf.minim.*;

Minim minim;
AudioPlayer song;

float x = 0;
float y = 0;

void setup () {
  size (400, 400);
  noStroke ();

  // Load an audio file into the player
  minim = new Minim (this);
  song = minim.loadFile("Call me maybe.mp3");
  song.play ();
}

void draw () {
  // Black semi-transparent background
  fill (35, 54, 60, 30);
  rectMode (CORNER);
  rect (0, 0, width, height);

  // Size of the rect in relation to the volume of the audio file.
  float d = song.mix.level() * 250;


  for (int a=30; a<width; a=a+50) {
    for (int b=0; b<width; b=b+50) {
      rectMode(CENTER);
      fill(#9EEFFC);
      rect(a, b, d, 15);
      ellipseMode(CENTER);
      noFill();
      stroke(#15626F);
      strokeWeight(2);
      ellipse(d, b-0.3, d, d);
    }
  }
}

