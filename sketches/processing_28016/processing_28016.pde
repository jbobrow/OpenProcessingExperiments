
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer mCl;
AudioPlayer mDl;
AudioPlayer mEl;
AudioPlayer mFl;
AudioPlayer mGl;
AudioPlayer mAl;
AudioPlayer mBl;
AudioPlayer mCm;
AudioPlayer mDm;
AudioPlayer mEm;
AudioPlayer Cm7;
AudioPlayer Dm7;
AudioPlayer Em7;
AudioPlayer Fm7;
AudioPlayer Gm7;
AudioPlayer Am7;
AudioPlayer Bm7;


int space = 50;
int value;

void setup() {
  background(0);
  size(500, 500);
  smooth();
  minim = new Minim(this);
  mCl = minim.loadFile("major C low.wav");
  mDl = minim.loadFile("major D low.wav");
  mEl = minim.loadFile("major E low.wav");
  mFl = minim.loadFile("major F low.wav");
  mGl = minim.loadFile("major G low.wav");
  mAl = minim.loadFile("major A low.wav");
  mBl = minim.loadFile("major B low.wav");
  mCm = minim.loadFile("major C middle.wav");
  mDm = minim.loadFile("major D middle.wav");
  mEm = minim.loadFile("major E middle.wav");
  Cm7 = minim.loadFile("C#min7.wav");
  Dm7 = minim.loadFile("D#min7.wav");
  Em7 = minim.loadFile("E#min7.wav");
  Fm7 = minim.loadFile("F#min7.wav");
  Gm7 = minim.loadFile("G#min7.wav");
  Am7 = minim.loadFile("A#min7.wav");
  Bm7 = minim.loadFile("Bmin7.wav");
}

void draw() {
  stroke(0);
  for (int x = 0; x <= width; x = x + space ) {
    fill(255);
    rect(x - 50,0,x,height);
  }

  if (mousePressed == true) {
    fill(255);
  } else {
    fill(0);
  }
  rect(30, 0, 40, 300);
  rect(80, 0, 40, 300);
  rect(180, 0, 40, 300);
  rect(230, 0, 40, 300);
  rect(280, 0, 40, 300);
  rect(380, 0, 40, 300);
  rect(430, 0, 40, 300);
}

void mousePressed() {
  //major C low
  if (mouseX > 0 && mouseX < 50 && mouseY >300) {
    mCl = minim.loadFile("major C low.wav");
    mCl.play(); 
  }
  //major D low
  if (mouseX > 50 && mouseX < 100 && mouseY >300) {
    mDl = minim.loadFile("major D low.wav");
    mDl.play();
  } 
  //major E low
  if (mouseX > 100 && mouseX < 150 && mouseY >300) {
    mEl = minim.loadFile("major E low.wav");
    mEl.play();
  }
    //major F low
  if (mouseX > 150 && mouseX < 200 && mouseY >300) {
    mFl = minim.loadFile("major F low.wav");
    mFl.play();
  } 
    //major G low
  if (mouseX > 200 && mouseX < 250 && mouseY >300) {
    mGl = minim.loadFile("major G low.wav");
    mGl.play();
  } 
    //major A low
  if (mouseX > 250 && mouseX < 300 && mouseY >300) {
    mAl = minim.loadFile("major A low.wav");
    mAl.play();
  }
    //major B low
  if (mouseX > 300 && mouseX < 350 && mouseY >300) {
    mBl = minim.loadFile("major B low.wav");
    mBl.play();
  }
    //major C middle
  if (mouseX > 350 && mouseX < 400 && mouseY >300) {
    mCm = minim.loadFile("major C middle.wav");
    mCm.play();
  }
    //major D middle
  if (mouseX > 400 && mouseX < 450 && mouseY >300) {
    mDm = minim.loadFile("major D middle.wav");
    mDm.play();
  }
    //major E middle
  if (mouseX > 450 && mouseX < 500 && mouseY >300) {
    mEm = minim.loadFile("major E middle.wav");
    mEm.play();
  }
    //C#min7
  if (mouseX > 30 && mouseX < 70 && mouseY <300) {
    Cm7 = minim.loadFile("C#min7.wav");
    Cm7.play();
  }
    //D#min7
  if (mouseX > 80 && mouseX < 120 && mouseY <300) {
    Dm7 = minim.loadFile("D#min7.wav");
    Dm7.play();
  }
    //E#min7
  if (mouseX > 180 && mouseX < 220 && mouseY <300) {
    Em7 = minim.loadFile("E#min7.wav");
    Em7.play();
  }
    //F#min7
  if (mouseX > 230 && mouseX < 270 && mouseY <300) {
    Fm7 = minim.loadFile("F#min7.wav");
    Fm7.play();
  }
    //G#min7
  if (mouseX > 280 && mouseX < 320 && mouseY <300) {
    Gm7 = minim.loadFile("G#min7.wav");
    Gm7.play();
  }
    //A#min7
  if (mouseX > 380 && mouseX < 420 && mouseY <300) {
    Am7 = minim.loadFile("A#min7.wav");
    Am7.play();
  }
    //Bmin7
  if (mouseX > 430 && mouseX < 470 && mouseY <300) {
    Bm7 = minim.loadFile("Bmin7.wav");
    Bm7.play();
  }
}

void stop(){  
 minim.stop();
  super.stop();
}

