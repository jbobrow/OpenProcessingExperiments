
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
song = minim.loadFile("02 Halo.mp3");
song.play ();
}

void draw () {
// Black semi-transparent background
fill (35, 54, 60, 30);
rectMode (CORNER);
rect (0, 0, width, height);

// Size of the rect in relation to the volume of the audio file.
float dimension = song.mix.level() * 250;

