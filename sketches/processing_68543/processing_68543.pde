
/* Homework2_9.24.2012
 Adding Versatility
 Author: Steven Ko
 
 copyright © Steven Ko
 All Rights Reserved, 2012
 
 */

void setup  () {
  size ( 400, 400 );
  background ( 69, 69, 82 );
  smooth ( );
  frameRate (25);
}

void draw () {
  background (69, 69, 82);
  float x, y, wd, ht, r, b, g, alp;

  x = 50;
  y = 50;
  wd = 300;
  ht = 300;

  r = random (50, 175);
  b = random (50, 100);
  g = random (50, 100);
  alp = random (150, 255);


  // outer circle
  noFill ( );
  strokeWeight ( 2 );
  stroke ( 255, alp-100 );
  ellipse ( x + wd * .5, y + ht *.5, wd, ht ); 


  //primary circle
  noFill ( );
  strokeWeight ( 4 );
  stroke ( 255);
  ellipse ( x  + wd * .5, y + ht *.5, wd - 10, ht -10 ); 


  /*
   // Initials Reference Points
   strokeWeight ( 5 );
   stroke ( 255, 0, 0 );
   
   point ( x + wd * .5, y + ht * .95 );  //center line
   point ( x + wd * .5, y + ht * .9 ); 
   point ( x + wd * .5, y + ht * .12 );
   point ( x + wd * .5, y + ht * .1 );
   
   point ( x + wd * .3, y + ht *.175);  // Top portion of "S"
   point ( x + wd * .175, y + ht *.4);
   
   point ( x + wd * .0825, y + ht *.5); // Middle Portion of "S"
   point ( x + wd * .45, y + ht *.5);
   
   point ( x + wd *.45, y +ht * .90);  // Bottom Portion of "S"
   point ( x + wd * .3, y + ht * .825);
   point ( x + wd * .175, y + ht * .6);
   point ( x + wd * .1, y + ht * .55);
   
   point ( x + wd * .82, y + ht * .23); // "K"
   point ( x + wd *.52, y + ht * .5); 
   point ( x + wd * .82, y + ht * .78); 
   */



// Initials
  stroke ( r -50, g +100, b +100, alp-100 );
  strokeWeight ( 3 );
  strokeCap (SQUARE);
 
 
  beginShape ();
  curveVertex ( x + wd * .5, y + ht * .95 ); // center line
  curveVertex ( x + wd * .5, y + ht * .9 ); 
  curveVertex ( x + wd * .5, y + ht * .1 );
  curveVertex ( x + wd * .5, y + ht * .1 );
  endShape ();

  beginShape ();
  curveVertex ( x + wd * .5, y + ht * .1 ); //top "S"
  curveVertex ( x + wd * .5, y + ht * .1 );
  curveVertex ( x + wd * .3, y + ht *.175); 
  curveVertex ( x + wd * .175, y + ht *.4);
  curveVertex ( x + wd * .0825, y + ht *.5); 
  curveVertex ( x + wd * .0825, y + ht *.5);
  endShape ();

  beginShape();
  curveVertex ( x + wd * .0825, y + ht *.5); //middle "S"
  curveVertex ( x + wd * .0825, y + ht *.5);
  curveVertex ( x + wd * .45, y + ht *.5);
  curveVertex ( x + wd * .45, y + ht *.5);
  endShape ();

  beginShape();
  curveVertex ( x + wd * .45, y + ht *.5);
  curveVertex ( x + wd * .45, y + ht *.5);
  curveVertex ( x + wd *.45, y +ht * .90);
  curveVertex ( x + wd * .45, y + ht *.90);
  endShape ();

  beginShape ();
  curveVertex ( x + wd *.45, y + ht * .90); //bottom "S"
  curveVertex ( x + wd *.45, y + ht * .90);
  curveVertex ( x + wd * .3, y + ht * .825);
  curveVertex ( x + wd * .175, y + ht * .6);
  curveVertex ( x + wd * .1, y + ht * .55);
  curveVertex ( x + wd * .0825, y + ht * .5);
  endShape ();


  strokeWeight (4); 
  stroke (r, 200, b, alp);
  
  beginShape ();
  vertex ( x + wd * .82, y + ht * .23); //"K"
  vertex ( x + wd *.52, y + ht * .5); 
  vertex ( x + wd * .82, y + ht * .78);
  endShape();

  noStroke (); // pizza slice
  fill (255, g, b, alp);
  arc (x + wd * .575, y + ht * .5, wd * .70, ht *.70, -PI/4 + .075, PI/4- .075);

//saveFrame ("hw2.jpg");

}


