
/*Joseph Kotay. Practice Computational Methods. Loops and Transformations. Professor Nick Senske.
This is just another simple pattern using circles and squares.  I referenced the example
of the "Dotted Circles" code that Nick provided.  Nothing fancy, however the objectives are met.*/

size(400,400);
smooth();
background(0);
rectMode(CENTER);

translate(width/2, height/2); //reset the origin to center.

ellipse(0,0,25,25); // center cicle.

// the next two arrays of squares.

int rectSize = 10;
int radius = 20;

fill(240,240,60);

for(int i = 0; i < 360; i += 45) {
  pushMatrix();
  rotate(radians(i));
  translate(radius,0);
  rotate(radians(45));
  rect (0,0,rectSize,rectSize);
  popMatrix();
}

fill(120,180,30);

int rectSize2 = 15;
int radius2 = 40;

for(int i = 0; i < 360; i += 45) {
  pushMatrix();
  rotate(radians(i));
  translate(radius2,0);
  rotate(radians(45));
  rect (0,0,rectSize2,rectSize2);
  popMatrix();
}

// The next two arrays of circles.

fill(255);

int circleSize = 25;
int radius3 = 65;

for(int i = 0; i < 360; i += 90) {
  pushMatrix();
  rotate(radians(i));
  translate(radius3,0);
  ellipse(0,0,circleSize,circleSize);
  popMatrix();
}

fill(240,240,60);

int circleSize2 = 40;
int radius4 = 100;

for(int i = 0; i < 360; i += 45) {
  pushMatrix();
  rotate(radians(i));
  translate(radius4,0);
  ellipse(0,0,circleSize2,circleSize2);
  popMatrix();
}

//the outer array of squares.

fill(120,180,30);

int rectSize3 = 55;
int radius5 = 160;

for(int i = 0; i < 360; i += 30) {
  pushMatrix();
  rotate(radians(i));
  translate(radius5,0);
  rotate(radians(45));
  rect (0,0,rectSize3,rectSize3);
  popMatrix();
}





