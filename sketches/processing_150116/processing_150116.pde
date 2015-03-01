

// Department of Dynamic Media
// SOS iDesign
// Name: LIM HYUNSEUNG
// ID: 201420104

import ddf.minim.*;

Minim minim;
AudioPlayer song;

float angle;
float x, y;
boolean dir = true;

float dia;

void setup () {
  size (800, 800);
  background(0);
  smooth();
  noCursor();
  noiseSeed(10);
  
  x = 0;

  minim = new Minim(this);
  song = minim.loadFile("a.mp3");
  song.play();
}

void draw () {
  translate(0, 0);
  fill (0,250);
  noStroke();
  ellipseMode(CORNER);
  ellipse(0, 0, width, height);

  
  if (dir) angle += 0.001;
  if (!dir) angle -= 0.001;

  float d = song.mix.level() * 200;
  dia = dia*0.9+d*0.9;
  
  float n = song.mix.level() * 100;
  n = n*0.9+song.mix.level() * 200 *0.9;
  dia= dia*0.9;

  stroke (250, 250, 250);
  strokeWeight(1);
  noFill ();

  
  translate(width/2, height/2);
  for (float i=0; i<100; i++) {
    rotate(angle);
    if (!dir) bezier (y, 0, dia, dia-50,dia+50,0,x,0);
    if (dir) line (x, 0, dia, dia);
    if(y < height)
    if (x > width) {
      x = 0;
    }
  }
}

void keyPressed() {
  if (keyCode==TAB) dir = !dir;
}
