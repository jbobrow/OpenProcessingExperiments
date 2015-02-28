
/* Konkuk University
 Department of Dynamic Media
 SOS iDesign
 Name: KIM Hyemi
 ID: 201420076
 
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
song = minim.loadFile("BOLERO DE RAVEL.mp3");
song.play ();
}

void draw () {
  background(255);
  
// Black semi-transparent background
fill (35, 54, 60, 30);
rectMode (CORNER);
rect (0, 0, width, height);

// Size of the rect in relation to the volume of the audio file.
float dimension = song.mix.level() * 250;

for (int a = 10; a<1024; a = a+30) {
    for (int b = 10; b<768; b = b+30) {
        
      stroke(0);
      fill(random(255));
      ellipse(a, b, dimension, 45);
      fill(random(255));
      strokeWeight(2);
}
}
}
