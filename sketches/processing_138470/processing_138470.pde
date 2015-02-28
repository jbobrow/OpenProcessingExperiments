
/*
Jaeseong Yi
 Mar 06 2014
 Creative Computing Section B
 Benjamin Bacon
 */

int d1 = 0;
int direction1 = 5;
int d2 = 800;
int direction2 = -20;
int d3 = 0;
int direction3 = 10;
int d4 = 800;
int direction4 = -5;
int d5 = 0;
int direction5 = 35;


void setup() {
  background(255);
  size(800, 800);
  smooth();
}



void draw() {


  int c1 = int(random(0, 255)); //red
  int c2 = int(random(0, 255)); //green
  int c3 = int(random(0, 255)); //blue
  int s = int(random(0, 100)); //size

  stroke(50, 50, 150);
  fill(c1, c2, c3);
  ellipse(d1, 0, 100, 100);


  d1=d1+direction1;
  if ( d1 > width ) {
    direction1 = -5;
  } 
  else if ( d1 < 0 ) {
    direction1 = 5;
  }

  ellipse(d2, 100, 100, 100);
  d2=d2+direction2;
  if ( d2 < 0 ) {
    direction2 = 20;
  } 
  else if ( d2 > width ) {
    direction2 = -20;
  }

  ellipse(d3, 350, 400, 400);
  d3=d3+direction3;
  if ( d3 > width ) {
    direction3 = -10;
  } 
  else if ( d3 < 0 ) {
    direction3 = 10;
  }

  ellipse(d4, 675, 250, 250);
  d4=d4+direction4;
  if ( d4 <0 ) {
    direction4 = 5;
  } 
  else if ( d4 > width ) {
    direction4 = -5;
  }

  if (mousePressed) {
    noStroke();
    fill(255, 255, 255);
    ellipse(mouseX, mouseY, 100, 100);
  }
}



