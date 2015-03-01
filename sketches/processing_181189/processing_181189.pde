
/*
TRANSFORMATIONS
rotation example: 
draw an arbitrary number of rects,
each rotated slightly about its center
*/

size(400,400); //set canvas size

//variables
int boxW = 60; //rect width
int boxH = 60; //rect height
int numRect = 8; //number of rects to draw
float rotation = radians( 180 / numRect ); //amount to rotate each rect

noFill(); //no fill

//move the coordinate system putting the origin (0,0) at the center of the canvas
translate( width / 2 , height / 2  );

//for loop to draw the rects
for( int i = 0; i < numRect; i = i + 1 ){
  rotate( rotation ); //rotate the coordinate system
  rect( 0 - boxW/2, 0 - boxH/2, boxW, boxH); //draw the rect
  println("drawing: " + i); //a little output
}

//we're done, reset the coordinate system
resetMatrix();



