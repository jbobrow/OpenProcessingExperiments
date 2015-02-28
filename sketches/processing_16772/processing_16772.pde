
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import processing.video.*;

AudioPlayer ap;
Minim minim;

Movie myMovie;

Text txt;
PFont fontA;

int num = 0;

/////////////////////////////////

void setup() {

  size(640,480);

  myMovie = new Movie(this, "MVI_4137.AVI");
  myMovie.loop();

  minim = new Minim(this);
  ap = minim.loadFile("Channels_Inserts.mp3");
  ap.play();

  smooth();
  fill (0);
  textAlign (CENTER, CENTER);
  fontA = loadFont ("Helvetica-Bold-100.vlw");

  txt = new Text();
}

/////////////////////////////////



void draw() {

  image(myMovie, 0, 0);
  txt.displayText();
  textFont(fontA, ap.mix.level()*10000);
}

