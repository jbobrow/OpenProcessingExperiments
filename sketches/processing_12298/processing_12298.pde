
// Assignment #2
// Name: Caitlin Fregoe
// E-mail: cfregoe@brynmawr.edu 
// Date: 9/15/2010


float x, y, w, h; 
// these are the coordinates of the top left corner <x, y>, 
//and the width (w) and height (h) of the enclosing rectangle

void setup() {
// set the screen size and all other drawing directives
  size(500, 500);
  smooth();

	// set the x, y, w, h to some specific values
	x = 100;

	y = 100;

	w = 100;

	h = 100;

}

void draw() {
// draw the object so that its top left corner is at <x, y> 
// and is of size w x h
  background(232, 209, 208);
  noStroke();
  fill(191, 181, 181);
  beginShape(); //bottom of background
  vertex(0, 330);
  vertex(300, 330);
  vertex(500, 330);
  vertex(500, 450);
  vertex(500, 500);
  vertex(0, 500);
  vertex(0, 450);
  endShape(CLOSE);
  
  strokeWeight(2);
  stroke(0);
  line(0, 330, 500, 330); //line separating two colors of bg
  strokeWeight(2);
  stroke(201, 186, 152);
  fill(232, 207, 157);
  rect(x + 250, y + 161 , 100, 100); //rect on bottom of leftmost shape
  
  strokeWeight(2);
  stroke(183, 168, 135);
  fill(201, 186, 152);
  beginShape(); //top of leftmost shape
  vertex(x + 250, y + 160); //leftmost point
  vertex(x + 280, y + 120); //top of triangle
  vertex(x + 290, y + 100); //top of rectangle at top of shape
  vertex(x + 310, y + 100); //across from the prev. point
  vertex(x + 320, y + 120); //below and over from prev. pt.
  vertex(x + 350, y + 160); //bottom point across from first pt.
  vertex(x + 310, y + 160); //point between bottom points
  endShape(CLOSE);
  
  strokeWeight(2);
  stroke(81, 136, 242);
  fill(160, 192, 255);
  beginShape(); //blue bottle
  vertex(x + 190, y + 80);
  vertex(x + 190, y + 30); //top left
  vertex(x + 210, y + 30); //top right
  vertex(x + 210, y + 80);
  vertex(x + 228, y + 160);
  vertex(x + 230, y + 190);
  vertex(x + 220, y + 245);
  vertex(x + 180, y + 245);
  vertex(x + 170, y + 185);
  vertex(x + 175, y + 140);
  endShape(CLOSE);
  
  strokeWeight(2);
  stroke(183, 168, 135);
  fill(229, 224, 213);
  beginShape(); //grayish white bottle
  vertex(x + 150, y + 60);
  vertex(x + 150, y + 10); //top left
  vertex(x + 170, y + 10); //top right
  vertex(x + 170, y + 60);
  vertex(x + 186, y + 150);
  vertex(x + 185, y + 190);
  vertex(x + 180, y + 260);
  vertex(x + 140, y + 260); //bottom of bottle
  vertex(x + 135, y + 190);
  vertex(x + 135, y + 150);
  vertex(x + 150, y + 60);
  endShape(CLOSE);
  
  strokeWeight(2);
  stroke(88, 73, 73);
  fill(118, 97, 97);
  beginShape(); //another bottle
  vertex(x + 30, y + 100);
  vertex(x + 30, y + 80);
  vertex(x + 50, y + 80);
  vertex(x + 50, y + 100); //these are good up here
  vertex(x + 70, y + 145);
  vertex(x + 70, y + 160);
  vertex(x + 70, y + 190);
  vertex(x + 70, y + 220);
  vertex(x + 60, y + 250);
  vertex(x + 20, y + 250);
  vertex(x + 10, y + 220);
  vertex(x + 10, y + 173);
  vertex(x + 10, y + 143);
  vertex(x + 30, y + 100);
  endShape(CLOSE);
  
  strokeWeight(1); //orange
  stroke(232, 93, 23);
  fill(255, 143, 23);
  ellipse(x + 90, y + 225, 60, 60);
  
}  


void mousePressed() {
// set x, y, w, h to some new value(s)
  x = 110;
  
  y = 110;
  
  w = 60;
  
  h = 60;
  
  
}

