
/*****************************************
 * Assignment 01
 * Name:   Angela Mastrianni
 * E-mail:  amastriann@brynmawr.edu
 * Course:      CS 110 - Section 01
 * Submitted:    9/11/2012
 * 
 * This is a sketch of a birthday cake with candles that "light up".
 *
***********************************************/

void setup () {
  size ( 500, 500);
  background (225);
  smooth ();
  frameRate (2);
}

void draw () {
  //draw plate
  strokeWeight (7);
  fill (100);
  ellipse ( 250, 400, 475, 100);

  //draw cake
  strokeWeight (1);
  fill ( 85,42,0);
  rect ( 70, 115, 325, 300);

  //draw stripes on cake
  fill ( 200, 0, 40);
  rect ( 70, 145, 325, 40);
  rect ( 70, 235, 325, 40);
  rect ( 70, 325, 325, 40);

  //draw 18 on cake
  stroke ( 255, 255, 255);
  strokeWeight (12.0);
  line ( 150, 150, 150, 400);
  noFill ();
  ellipse ( 250, 200, 100, 100);
  ellipse ( 250, 325, 100, 150);


  //draw candles
  stroke (0);
  strokeWeight (1);
  fill ( random(225), random(225), random(225));
  rect ( 90, 65, 30, 50);
  rect ( 152, 65, 30, 50);
  rect ( 214, 65, 30, 50);
  rect ( 276, 65, 30, 50);
  rect ( 338, 65, 30, 50);
}

void mouseClicked () {
  //light candles
  fill ( 230, 220, 0);
  ellipse ( 105, 45, 20, 50);
  ellipse ( 167, 45, 20, 50);
  ellipse ( 229, 45, 20, 50);
  ellipse ( 291, 45, 20, 50);
  ellipse ( 353, 45, 20, 50);
}





