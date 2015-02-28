
//Konkuk University
//Department of Dynamic Media
//SOS iDesign
//Name: YUN Sojung
//ID: 201420093

import ddf.minim.*;

Minim minim;
AudioPlayer song;

void setup () {
size (400, 400);
noStroke ();

// Create the audio tool 
minim = new Minim (this);
// Load an audio file into the player
song = minim.loadFile ("f.mp3");
// Play audio file
song.play ();
}

void draw () {
   
  background(255,230,210);
  for (int x1 = -20; x1 < width; x1 = x1+50) {
    for (int y1 = 60; y1 < height; y1 =y1+100) {
      noStroke();
      triangle (x1, y1, (x1 + 60), ( y1-40), (x1 +40), y1);
    }
  }
  fill( #6C8DFF);
  
}

