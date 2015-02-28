
// Assignment #2
// Name: Ariele Martinez
// E-mail: acmartinez@brynmawr.edu 
// Date: September 17, 2010


float x, y, w, h; // these are the coordinates of the top left corner <x, y>, 
//and the width (w) and height (h) of the enclosing rectangle

void setup() {
  size(500,500);
  smooth();
  background(205, 183, 158);
  // set the screen size and all other drawing directives
  // set the x, y, w, h to some specific values
  x = 250;
  y = 250;
  w = 120;
  h = 240;
}

void draw() {
  // draw the object so that its top left corner is at ,x, y> and is of size w x h
  //object: bottle of nail polish

  x = 250;
  y = 250;
  w = 120;
  h = 240;

  noStroke();
  //handle
  fill(0);
  rect(x + .3*w, y, .3*w, h*.5);
  //shadow
  fill(75);
  ellipse(w/2, y-10, w, .1*h);

  beginShape();
  fill(118, 238, 198);
  vertex(x + .2*w, y + .8*h);
  vertex(x, y + .5*h);
  vertex(x + w, y + .5*h);
  vertex(x + .8*w, y + .8*h);
  vertex(x + .2*w, y + .8*h);
  vertex(x + .8*w, y + .8*h);
  endShape(CLOSE);
}  


