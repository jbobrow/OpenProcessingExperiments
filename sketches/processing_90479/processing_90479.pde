
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int xpos = 250;
int ypos = 250;
int xpos1 = 0;
int ypos1 = 0;
int ypos2 = 500;
int movee = 1;
int mover = 1;
int xpos3 = 0;
int ypos3 = 0;
int mover2 = 1;
int xpos4 = 475;
int ypos4 = 0;
int movet = 1;
PImage img;

Minim minim;
AudioSample game;

void setup() {
  
  size(500,500);
  img = loadImage("Straight Edge.png");
  minim = new Minim(this);
  game = minim.loadSample("Technology Song SURPRISE.mp3");
  game.trigger();
  

}

void draw() {
 background(random(255), random(255), random(255));
  fill(random(255), random(255), random(255));
  rect (xpos , ypos, random(100), random(100));
  xpos = xpos + mover;
  if(xpos == 475) {mover = -1;}
  if(xpos == 0) {mover = 1;}
 
  ellipse(xpos1, ypos2, random(100), random(100));
  xpos1 = xpos1 + movee;
  ypos2 = ypos2 - movee;
  if(xpos1 == 25) {movee = 1;}
  if(ypos2 == 25) {movee = -1;}
  
  rect (xpos3 , ypos3, random(100), random(100));
  xpos3 = xpos3 + mover2;
  ypos3 = ypos3 + mover2;
  if(xpos3 == 0) {mover2 = 1;}
  if(ypos3 == 475) {mover2 = -1;}
  
  triangle(xpos4 , ypos4 , random(100), random(100), random(100), random(100));
  xpos4 = xpos4 + movet;
  ypos4 = ypos4 + movet;
  if(xpos4 == 0) {movet = 1;}
  if(ypos4 == 475) {movet = -1;}
  
  image(img, 0, 0);
 
  
  
}


void stop() {
  
  game.close();
  minim.stop();
  
  

}


