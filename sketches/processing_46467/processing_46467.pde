

PImage joker; 
PImage batman;
int xpos = 0;
int value = 0;
import processing.video.*;
Movie serious;

void setup(){
  size(1000,625);
  joker = loadImage("joker1.jpg");
  batman = loadImage("batman_3_the_dark_knight_rises-wide.jpg");
  background(batman);
  serious = new Movie (this, "serious2.wav");
}


void draw(){
  int xp = int(random(width));
  int yp = int(random(height));
  color c = joker.get(xp,yp);
  fill(c,600);
  noStroke();
  rect(xp,yp,random(30,90),random(30,40));
}

void mousePressed() {
  serious.stop();
  serious.play();
}



