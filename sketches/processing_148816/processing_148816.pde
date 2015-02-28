
import ddf.minim.*;

Minim minim;
AudioPlayer song;
float t = 40;
float x = 0;
float y = 0;

void setup () {
  size (400, 400);
  noStroke ();
  
  minim = new Minim (this);
  song = minim.loadFile("iuiu.mp3");
  song.play ();
}

void draw () {

  fill (35, 54, 60, 30);
  rectMode (CORNER);
  rect (0, 0, width, height);

  float p = song.mix.level() * 250;

  for (int a = 30; a<1024; a = a + 60) {
    for (int b = 30; b<1024; b = b + 60) {
      fill(7, 229, 146);
      rectMode(CENTER);
      noStroke();
      rect(a, b, p, p);
      line(a, b, p, 768);
    }
  }
  for (int c = 60; c<1000; c = c + 60) {
    for (int d = 60; d<1000; d = d + 60) {
      fill(0, 196, 191);
      noStroke();
      ellipse(c, d, p-10, p);
      ellipse(c, d, p, p-10);
    }
  }
}

