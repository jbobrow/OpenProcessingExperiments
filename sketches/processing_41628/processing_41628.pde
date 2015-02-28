
import processing.opengl.*;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer player;
AudioPlayer static2;

float cx1 = 0;
float cx2 = 0;
float cy1 = 0;
float cy2 = 0;

float c2x1 = 0;
float c2x2 = 0;
float c2y1 = 0;
float c2y2 = 0;

int grad = 10;

float pos1 = random (1, 500);

float ends = 0;

float r = 0;

void setup() {
  size (400, 700, OPENGL);

  m = new Minim(this);

  player = m.loadFile("crazy.wav"); // just need minim and load file once
  static2 = m.loadFile("crazy.wav");
  player.play();

  background(0);
  smooth();
  noCursor();
  
  

}

void draw() {
  fill(0, 1);
  noStroke();
  //rect(0, 0, width, height); 
  
  translate(mouseX,mouseY);
  rotate(r);
  r = r+0.02;
    translate(-mouseX,-mouseY);


  
  
  stroke(#1DA7F0, 10);
  strokeWeight(2);
  if (mousePressed) {

    player.loop(0);

    ends = random (0,500);
    cx1 = random (0, 400);
    cx2 = random (0, 400);
    cy1 = random (0, 400);
    cy2 = random (0, 400);
    noFill();
    bezier((mouseX-100), mouseY, cx1, cy2, cx2, cy2, (mouseX+100), mouseY); 
    c2x1 = random (0, 400);
    c2x2 = random (0, 400);
    c2y1 = random (0, 400);
    c2y2 = random (0, 400);
    noFill();
    bezier((mouseX+100), mouseY, c2x1, c2y1, c2x2, c2y2, (mouseX-100), mouseY);
  }
  else {
    line ((mouseX-100), mouseY, (mouseX+100), mouseY);
    if (player.isPlaying() == true) { 
    static2.play();
    }
  }
}

void mouseReleased() {
  if (player.isPlaying() == true) {
    player.pause();
    player.rewind();
  }
}


