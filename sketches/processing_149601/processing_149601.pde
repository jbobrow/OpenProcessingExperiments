
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name:PARK Jeungeun
// ID: 201420080
import ddf.minim.*;

Minim minim;
AudioPlayer song;

float x = 0;
float y = 0;

void setup () {
size (1024, 760);
noStroke ();

// Load an audio file into the player
minim = new Minim (this);
song = minim.loadFile("Somewhere.mp3");
song.play ();
}

void draw () {

rectMode (CORNER);
rect (0, 0, width, height);

// Size of the rect in relation to the volume of the audio file.
float dimension = song.mix.level() * 250;

background(#2B7DFC);
 
for (int a = 10; a<1024; a = a+150) {
for (int b = 10; b<768; b = b+150) {
       
strokeWeight(1);
stroke(#1D4583);
line(dimension,b-10,dimension,10);

stroke(#BABCA0);
strokeWeight(random(10));
fill(#F3FA95);
ellipse(a, b, dimension,dimension);
  
}
}
}
void keyPressed() {
     background(0);
     redraw();
}
