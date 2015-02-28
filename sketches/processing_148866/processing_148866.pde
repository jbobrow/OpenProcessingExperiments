
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

song = minim.loadFile("a.mp3");

song.play ();

}

 

void draw () {

// Black semi-transparent background

fill (35, 54, 60, 30);

rectMode (CORNER);

rect (0, 0, width, height);

 

// Size of the rect in relation to the volume of the audio file.

float d = song.mix.level() * 250;

 

fill(#96FFFF);

  for (int i=30; i<width; i=i+20) {

    for (int j=0; j<width; j=j+20) {

      noStroke();

      fill(#28A8A8);

pushMatrix();

 translate (i,j);

  triangle (50,d,20,30,40,50);

  popMatrix();

    }

  }

}

