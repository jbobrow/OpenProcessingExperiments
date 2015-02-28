
import processing.opengl.*;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer player;
AudioPlayer static2;

// electricity curves
float cx1 = 0;
float cx2 = 0;
float cy1 = 0;
float cy2 = 0;
float c2x1 = 0;
float c2x2 = 0;
float c2y1 = 0;
float c2y2 = 0;

//cursor points
float mp = 0;

//rotation speed
float r = 0;

//line length
float zapX = 200;
float zapY = 350;

//dirction 
float dirY;
float dirX;

float rot = 0;

void setup() {
  size (400, 700, OPENGL);

  m = new Minim(this);

//load music
  player = m.loadFile("crazy.wav"); // just need minim and load file once
  static2 = m.loadFile("woosh.wav");
//play woosh noise
  static2.play();
  static2.loop();
  
//setup functions  
  background(0);
  smooth();
  noCursor();
  
//call directions
  dirY = random(-3,3);
  dirX = random(-3,3);
}

void draw() {
//mouse  
   stroke(#94D9FC, 40);
   strokeWeight(2);
   mp = random (0,9);
   bezier(mouseX,mouseY,(mouseX+mp),(mouseY-mp),(mouseX+mp),(mouseY+mp),(mouseX+mp),(mouseY+mp));
   
//background fade
   fill(0, 10);
   noStroke();
   rect(0, 0, width, height); 
   
//direction of ball
  zapY = zapY+dirY;
  if (zapY >= 700 || zapY <= 0){
    dirY = dirY*-1;
  }
   zapX = zapX+dirX;
  if (zapX >= 400 || zapX <= 0){
    dirX = dirX*-1;
  }
  
//rotation of line
  translate(zapX,zapY);
  rotate(r);
  r = r+0.04;
  translate(-zapX,-zapY);
  
/////ELECTRICITY CALLED\\\\\
//Style 
  stroke(#1DA7F0, 200);
  strokeWeight(2);
  
//When its called
  if (dist(zapX,zapY, mouseX, mouseY)<100) {
    
//sounds   
    player.play();
  if(!player.isPlaying())
    player.loop();

//Current is created
    stroke(#94D9FC,70);
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
  
//draws a line instead of electricity
  else {
    stroke(#1DA7F0, 100);
    line ((zapX-100), zapY, (zapX+100), zapY);
    player.pause();

  }
}


