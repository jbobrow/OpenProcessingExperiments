
// @pjs preload must be used to preload the image

/* @pjs preload="sphere.jpg"; */

PImage img;

img = loadImage( "sphere.jpg" );

size( 400, 400 );

image( img, 0, 0, 400, 400 );

tint(0, 153, 204, 126); 
image( img, width/2, height/2, width/2, height/2 );


