
import processing.opengl.*;

import krister.Ess.*;


FFT myfft;
AudioInput myinput;
int bufferSize=512;


int wh = 700;
int ww = 900;
int i = 1;


class Ball{
  float x, y, r, m;
  int col;

  // default constructor
  Ball() {
  }

  Ball(float x, float y, float r, int col) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.col = col;
    m = r*.1;
  }
}

Ball[] balls =  { 
  new Ball(ww/2, wh/2, 80, 255),
};



void setup() {
  size(ww,wh,OPENGL);
  frameRate(45);
  background(255);
  noStroke();
  smooth();

  Ess.start(this);
  myinput=new AudioInput(bufferSize);
  myfft=new FFT(bufferSize*2);
  myinput.start();

  myfft.damp(.5);
  myfft.equalizer(true);
  myfft.limits(.005,.01);
}

void draw() {
  background(255);    
  for (int i = 0; i < balls.length; i++) {
    ellipse(balls[i].x, balls[i].y, balls[i].r+myfft.averages[0]*400,balls[i].r+myfft.averages[0]*400);
    //fill(0,0, 0, 255-myfft.averages[0]*510);
    fill(0,0,0,255);
  }
    if (myfft.averages[0] > 0.3) {
      Ball b = new Ball(random(ww), random(wh), random(80), (int)random(255));
      balls = (Ball[]) append(balls, b);
    }
}

public void audioInputData(AudioInput theInput) {
  myfft.getSpectrum(myinput);
}

