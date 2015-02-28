
/*

 Liz Rutledge
 Day 1 Example
 August 2, 2011
 
 */

void setup() {
  background(100);
  size(600, 400);
  smooth();
  frameRate(1);
}


void draw() {

/**************RECTANGLE SECTION*************/

  //rect(x-coordinate, y-coordinate, width, height);

  // drawing first rectangle
  fill(255, 100, 0); //set fill to orange
  stroke(255);
  rect(50, 50, 100, 100);

// draw second rectangle
  fill(0, 200, 200);
  stroke(0);
  rect(200, 50, 100, 100);

//  draw third rectangle
  fill(255, 0, 0);
  stroke(140);
  rect(350, 50, 100, 100);


/************CIRCLE SECTION***********/

  fill(255, 0, 0);
  stroke(0);
  ellipse(400, 300, 50, 50);
}


