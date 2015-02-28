
/*
*Assignment #2
 *Nancy Toure
 *ntoure@brynmawr.edu
 *CS 110 Section 2
 *Submitted 2/7/2012
 This program contains the code
 for making a sky and a ground.
 Mouse pressed was used to make two different
 objects appear.  The hardest part about this project
 was making the scale so that when the objects approached the horizon 
 they got smaller and as they were away from the horizon
 they got bigger. 
 */

float h;
float w;
void setup () {
  //sky and ground
  size(600, 600);
  w= width;
  h= height/2;


  //sky
  background(0, 50, 250);
  noStroke();
  smooth();

  //horizon of the sun
  for (int i= 400; i>50; i-=20) {
    stroke(255);
    fill(255, 255, 0);
    ellipse(width/2, height/2, i, i);
  }
  //ground, grass area
  noStroke();
  fill(0, 255, 0);
  rect(0, h, w, h);
}
void draw () {
}

void mousePressed() {
  float scal;

  //use to draw locations of 
  //clouds and rock
  if (mouseY < h) {

    scal = (h- mouseY)/h;
    cloud(mouseX, mouseY, scal);
  }
  else {
    scal = 1- mouseY/h;
    rock(mouseX, mouseY, scal);
  }
}


//setting up functions for cloud
void cloud(int x, int y, float scal ) {
  fill(255);
  noStroke();
  smooth();

  ellipse(x, y, scal*60, scal*60);
  ellipse(x+ 25*scal, y, scal*50, scal*50);
  ellipse(x- 25*scal, y, scal*50, scal*50);
}
//setting up fuctions for rock
void rock(int x, int y, float scal ) {
  fill(127);
  noStroke();
  smooth();

  ellipse(x, y+15, scal*70, scal*70);
  ellipse(x+ 20*scal, y+20, scal*60, scal*60);
  ellipse(x- 20*scal, y+20, scal*60, scal*60);
}


