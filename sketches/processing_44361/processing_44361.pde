
import colorLib.calculation.*;
import colorLib.*;
import colorLib.webServices.*;

Palette p1;

PImage img;

int step = 5;
int N = 20000;
int T = 0;
float R;


Walker[] walkers;

void setup() {    

  smooth();

  img = loadImage("greenie1.png");
  p1 = new Palette(this, img);    

  size(700, 400);
  background(20);

  R = height/2;
  translate(width/2, height/2);

  walkers = new Walker[N];

  for ( int i = 0; i < N; i++) {

    walkers[i] = new Walker();
    walkers[i].start();
  }

  frameRate(10);
}

void draw() {

  translate(width/2, height/2);

  fill(30, 5);
  rectMode(CENTER);
  rect(0, 0, width, height);

  for ( int i = 0; i < N; i++) {
    noStroke();
    walkers[i].walk_periodic_free();
  }

  if ( T % 25 == 0) {
    for ( int i = 0; i < N; i++) {
      walkers[i].check();
    }
  }

  T += 1;
}

void keyPressed() {

  if ( key == ' ') {
    saveFrame("  #### imagen.png");
  }
}


