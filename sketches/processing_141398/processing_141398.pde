
/* @pjs preload="tommy.jpg"; */
PImage tommy = loadImage("tommy.jpg");
image(tommy, 0, 0);
filter( THRESHOLD, 0.8 );
filter( BLUR, 2 );


