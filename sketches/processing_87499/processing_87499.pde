
//Min Kyung Kim, minkyunk@andrew.cmu.edu
//Homework5
//Copyright January 2013. All rights reserved.

float x, y, wd, ht;
color col;

void setup ( ) {
  size ( 400, 400 );
  background ( 255 );
  smooth ( );
  col = color (200, 200, random (255));
  
  x = 200;
  y = 200;
  wd = 200;
  ht = 200;
}

void draw ( ) {
  fill ( 154, 204, 255);
  rect ( 0, 0, width, height );
  
  fill (col);
  figure (mouseX, mouseY, wd, ht);
}

void figure (float fx, float fy, float fwd, float fht ) {
  noStroke ( );
  fill (col);
  fill (255);

  if (keyPressed == true) {
    if (key == 'c') {
      fill (col);
    } if (key == ' ') {
      wd = 1.05 * wd;
      ht = 1.05 * ht;
    } if (key == 'b') {
      wd = 0.95 * wd;
      ht = 0.95 * ht;
    }
  }
  
  ellipse ( fx, fy, fwd * .5, fht * .08 );
  triangle ( fx + (fwd * .18), fy, fx + (fwd * .35), fy - (fht * .1), fx + (fwd * .3), fy );
  triangle ( fx + (fwd * .18), fy, fx + (fwd * .35), fy + (fht * .1), fx + (fwd * .3), fy );
  triangle ( fx - (fwd * .1), fy, fx + (fwd * .15), fy - (fht *.3), fx + (fwd * .1), fy);
  triangle ( fx - (fwd * .1), fy, fx + (fwd * .15), fy + (fht *.3), fx + (fwd * .1), fy);

}




