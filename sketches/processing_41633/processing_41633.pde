
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

float zapX = 200;
float zapY = 350;

float dirY;
float dirX;


void setup() {
  size (400, 700, OPENGL);

  m = new Minim(this);

 

  player = m.loadFile("crazy.wav"); // just need minim and load file once
  static2 = m.loadFile("crazy.wav");
  player.play();

  background(0);
  smooth();
  noCursor();
  
  dirY = random(-1,1);
  dirX = random(-1,1);

}

void draw() {
  
   fill(#94D9FC, 10);
  noStroke();
  ellipse(mouseX,mouseY,20,20);
  fill(0, 10);
  noStroke();
  rect(0, 0, width, height); 
  
  zapY = zapY+dirY;
  
  if (zapY >= 700 || zapY <= 0){
    dirY = dirY*-1;
  }
  
   zapX = zapX+dirX;
  
  if (zapX >= 400 || zapX <= 0){
    dirX = dirX*-1;
  }
  
  
  
  
  
  translate(zapX,zapY);
  rotate(r);
  r = r+0.2;
    translate(-zapX,-zapY);


  
  
  stroke(#1DA7F0, 200);
  strokeWeight(2);
  if (dist(zapX,zapY, mouseX, mouseY)<100) {
    if(!player.isPlaying())
      player.loop(0);
   stroke(#94D9FC,200);
    ends = random (0,500);
    cx1 = random (0, 400);
    cx2 = random (0, 400);
    cy1 = random (0, 400);
    cy2 = random (0, 400);
    noFill();
    bezier((zapX-100), zapY, cx1, cy2, cx2, cy2, (zapX+100), zapY); 
    c2x1 = random (0, 400);
    c2x2 = random (0, 400);
    c2y1 = random (0, 400);
    c2y2 = random (0, 400);
    noFill();
    bezier((zapX+100), zapY, c2x1, c2y1, c2x2, c2y2, (zapX-100), zapY);
  }
  else {
    stroke(#1DA7F0, 200);
    line ((zapX-100), zapY, (zapX+100), zapY);
    if (player.isPlaying() == true) { 
    static2.play();
    }
  }
    if (player.isPlaying() == true) {
    player.pause();
    player.rewind();
  }
}



