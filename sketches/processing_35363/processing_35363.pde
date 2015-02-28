
// homework 1
// copyright John Swanson August 2011, Pittsburgh, PA 15221
size( 400,400);
background( 0, 0, 250);
//Background
fill ( 250, 100, 250);
for (int i = 0; i < 400; i = i+10) {
  for (int j = 0; j < 400; j = j+10) {
    ellipse(i, j, 5, 5);
  }
}
fill( 100, 100, 100);
strokeWeight( 12);
 triangle( 200, -50, -50, 450, 450, 450);
fill( 250, 100, 250);
noStroke();
 triangle( 200, 0, 0, 400, 400, 400);

//J
noStroke();
fill( 250, 0, 0);
 rect( 100, 25, 25, 100);
 arc( 100, 125, 50, 50, 0, 2);
//T
rect( 275, 25, 100, 25);
 rect( 315, 25, 25, 125);
//S
fill( 100, 250, 0);
noStroke();
 ellipse( 200, 275, 150, 150);
 ellipse( 200, 200, 150, 150);
 rect( 185, 110, 30, 40);
 rect( 185, 325, 30, 40);
fill( 250, 100, 250);
 ellipse( 200, 275, 50, 50);
 ellipse( 200, 200, 50, 50);
 triangle( 200, 250, 200, 301, 50, 220);
 triangle( 200, 174, 200, 225, 350, 255);
//J part
fill( 250, 0, 0);
 translate( width/2, height/2);
 rotate( 2);
 rect( -25, 120, 24, 24);
//saveFrame( "hw1.jpg");

