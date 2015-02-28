
import processing.video.*;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


float xs = 1.5;
float ys = 1.5;


boolean newball  = false;
//boolean dragging = false;


int size = 60;       // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = xs;  // Speed of the shape
float yspeed = ys;  // Speed of the shape

float xdirection = 2.5;  // Left or Right
float ydirection = 1.5;  // Top to Bottom

int c = 0;
float w = 0;

int dragging = 0;

Minim m;
Minim b;
AudioPlayer tic;
AudioPlayer but;
Minim s;
AudioOutput out;
SineWave sine;


ArrayList objects;

class laas {
  float x = 0;
  float y = 0;
  float z = 0;
  float w = 0;

  laas(float x, float y, float z, float w) {
    x = xpos+size/2;
    y = ypos+size/2;
    z = size;
    w = size;
    line(x, y, z, w);
  }

  void spin(float o) {

    rotate (o+15);
  }
}

void setup() {
  size(700, 400);
  smooth();


  background (c);
  b = new Minim(this);
  but = b.loadFile("but.wav");

  m = new Minim(this);
  tic = m.loadFile("tic.wav");

  s = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = s.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  sine = new SineWave(100, 0.5, out.sampleRate());


  out.addSignal(sine);
  xpos = width/2;
  ypos = height/2;
  //  
  //   objects = new ArrayList();
  //   objects.add(new ellipse(xpos+size/2, ypos+size/2, size, size));
}


void draw() {


  float r2 = random (120, 170);//color
  float g2 = random (100, 170);//color
  float b2 = random (100, 170); //color


  if (xpos < 350) {

    float freq = map(ypos, 0, height, 600, 60);
    sine.setFreq(freq);
    sine.setAmp(map(ypos, xpos, mouseX, mouseY, 10));
  }

  noStroke();
  fill(c);
  rect(0, 0, 350, 400);

  // stroke(0);
  //ect(340, 250, 30, 150);
  //rect(340, 0, 30, 150);



  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );

  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-size || xpos < 0) {
    xdirection *= -1;
    tic.play();
    tic.loop(0);
  }
  if (ypos > height-size || ypos < 0) {
    ydirection *= -1;
    tic.play();
    tic.loop(0);
  }
  float r =0;
  if (xpos > 350) {
    r = random(10);
    fill(0);
  }

  strokeWeight(1+r);
  stroke(0, 50);

  if (xpos < 350) {
    fill(r*250, r*2+20, r*4+7, 90);
  } 
  else {
    stroke(r2*2, g2*2, b2,90);
  }

  // Draw the shape
  ellipse(w+xpos+size/2, r+ypos+size/2, size, + size);
  aestic(xpos,ypos,0,0);

  if (w > 20) {
    w = w + w + 1;
  }

  if (mousePressed) { 
    if (xpos <350){
    mousedrag();
         }
  }

  if (xpos > 350) {
    but.play();
    but.loop(0);
    sine.setFreq(0);
  }

  if (mousePressed) {
    if (dist (xpos, ypos, mouseX, mouseY) < 1000) {
      dragging = 1;
    }

    if (dragging == 1) {
      xpos = mouseX +( xspeed * xdirection );
      ypos = mouseY;
    }
  }
}

void mousedrag() {
  newball = true;
  if (newball) { 
    line(xpos+size/2, ypos+size/2, size, size);
  }
}





void stop()
{
  out.close();

  s.stop();
  b.stop();
  m.stop();

  super.stop();
}

void mouseReleased() {
  dragging = 0;
}


void aestic (float x, float y, float z, float w) {
    x = xpos+size/2;
    y =ypos+size/2;
    z = size;
    w = size;

    line(x,y,z,w);
    while (x > 700){
    rotate (15);
    }
}


