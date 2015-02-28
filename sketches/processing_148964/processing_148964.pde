
import ddf.minim.*;
import controlP5.*;
//Initialiseer variabelen
Mol topRechts;
Mol topCenter;
Mol topLinks;

Mol midRechts;
Mol midCenter;
Mol midLinks;

Mol benedenRechts;
Mol benedenCenter;
Mol benedenLinks;

boolean gameOver;
boolean start;
boolean uitleg;

int score;
int lives;

PImage bg, bg1, bg2, bg3;

PFont f;

AudioPlayer song1;
AudioPlayer song2;
Minim minim;//audio context



void setup() {
  size(550, 550);
  imageMode(CENTER);
  textAlign(CENTER);
  score = 0;
  lives = 3;

  minim = new Minim(this);
  song1 = minim.loadFile("file.mp3", 2048);
  song2 = minim.loadFile("Brazil.mp3");
 // player = minim.loadFile("file.mp3", 2048);
  song1.play();

  f = loadFont("font/Constance-48.vlw");
  fill(255);
  bg = loadImage("images/gras.png");
  bg1 = loadImage("images/begin.png");
  bg2 = loadImage("images/gameover.png");
  bg3 = loadImage("images/mollenuitleg.png");
  background(bg1);

  smooth();
  noStroke();

  topRechts = new Mol(90+25, 95);
  topCenter = new Mol(250+25, 95);
  topLinks = new Mol(410+25, 95);

  midRechts = new Mol(90+25, 255);
  midCenter = new Mol(250+25, 255);
  midLinks = new Mol(410+25, 255);

  benedenRechts = new Mol(90+25, 415);
  benedenCenter = new Mol(250+25, 415);
  benedenLinks = new Mol(410+25, 415);
}
