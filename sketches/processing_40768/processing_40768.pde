
// i am a beginer ! is my first sketch 
// first step of Etienne Brunet from a page of "Learning Processing" de
// Daniel Shiffman (only for the color rectangle)


float r;
float g;
float b;
float a;

float diam;
float x;
float y;

import ddf.minim.*;

Minim minim;
AudioPlayer groove;

void setup() {
  size(900, 700);
  background(0);
  smooth();

  minim = new Minim(this);
  groove = minim.loadFile("Gray_noise.mp3");
  groove.loop(5);
}

void draw() {
  // Each time through draw(), new random numbers are picked for a new ellipse.
  r = random(155);
  g = random(100);
  b = random(200);
  a = random(185);
  diam = random(190);
  x = random(width);
  y = random(height);

  // Use values to draw an ellipse
  noStroke();
  fill(r, g, b, a);
  rect (x, y, diam, diam);
  // je rajoute de la typo
  // la typo est déssinée par jeremy.landes.nones du Startrek2011 
  PFont font;
  font = loadFont("Faber-25.vlw");
  textFont(font);
  fill(255);
  text("TINNITUS", x, y, diam, diam);
  fill(r, g, b, a+80);
  text("PARASITE", x, y+20, diam, diam);
  fill(r, g, b, a+40);
  text("SOLITUDE", x, y+40, diam, diam);
}

void stop()
{
  groove.close();
  minim.stop();

  super.stop();
}



