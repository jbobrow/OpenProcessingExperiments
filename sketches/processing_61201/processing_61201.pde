
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer Music;

PShape HNDC;
PShape HNDS;
PShape HNDA;
PShape HNDO;

int x = 0;

void setup() {
  size (400, 400);
  smooth();
  background(100);

  minim = new Minim(this);
  Music = minim.loadFile("HaveNiceDay.aif", 1024);

  HNDC = loadShape ("HND-C.svg");
  HNDS = loadShape ("HND-S.svg");
  HNDA = loadShape ("HND-A.svg");
  HNDO = loadShape ("HND-O.svg");
}

void draw() {

  if (mousePressed) {
    x = x +1;
    Music.play();
  } 
  else {
    x = 0;
  }

  if (x < 10) {
    shape(HNDC, 120, 40, 400, 400);
  } 
  else if (x > 10 && x < 20) {
    shape(HNDS, 120, 40, 400, 400);
  }
  else if (x > 20 && x < 30) {
    shape(HNDC, 120, 40, 400, 400);
  }
  else if (x > 30 && x < 40) {
    shape(HNDS, 120, 40, 400, 400);
  }
  else if (x > 40 && x < 50) {
    shape(HNDC, 120, 40, 400, 400);
  }
  else if (x > 50 && x < 60) {
    shape(HNDS, 120, 40, 400, 400);
  }
  else if (x > 60 && x < 70) {
    shape(HNDA, 120, 40, 400, 400);
  }
  else if (x > 70 && x < 80) {
    shape(HNDC, 120, 40, 400, 400);
  }
  else if (x > 50 && x < 60) {
    shape(HNDO, 120, 40, 400, 400);
  }
}

//Stop the audio on exit
void stop()
{
  // always close Minim audio classes when you finish with them
  Music.close();
  // always stop Minim before exiting
  minim.stop();

  super.stop();
}

