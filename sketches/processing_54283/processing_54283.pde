
// Vegetable Limerick 
// Steve Tiffany, 2012
// Uses sample amplitude to approximate lip sync --
// the louder the sample, the wider the mouth opens.

import ddf.minim.*;
Minim minim;
AudioPlayer limerick;
PImage face, eyes, mouth, upperLip;
int x,y,waitress;

void setup() {
  size(400, 400);
  smooth();
  frameRate(12); // low frame rate lessens lip-flap, but also reduces accuracy
  minim = new Minim(this);
  limerick = minim.loadFile("limerick.wav",1024);
  limerick.loop();
  face = loadImage("face.png");
  eyes = loadImage("eyes.png");
  mouth = loadImage("mouth.png");
  upperLip = loadImage("upperLip.png");
  noCursor();
  waitress = millis()+1000;
  x=103; y=135;
}

void draw() {
  background(255); 
  if (millis()>waitress) { // eyes move every second or two
    x = int(random(96,110)); y = int(random(132,137));
    waitress = millis() + int(random(1000,2000));
  }
  image(eyes,x,y);
  image(face,0,0); // face has transparent eye openings
  // one mid-buffer (512) amplitude reading per draw() cycle seems to be plenty...
  int mouthHeight = int(247 + (abs(limerick.mix.get(512)*200)));
  if (mouthHeight<252) {mouthHeight = 247;}
  if (mouthHeight>275) {mouthHeight = 275;}
  image(mouth,161,mouthHeight);
  image(upperLip,160,245); // covers part of mouth that needs to be hidden
}

void stop() {
  // always close Minim audio classes when you finish with them
  limerick.close();
  // always stop Minim before exiting
  minim.stop();
  super.stop();
}

