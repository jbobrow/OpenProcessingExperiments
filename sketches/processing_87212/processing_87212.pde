
// Homework 4, 01/29/2013
// Min Kyung Kim, minkyunk@andrew.cmu.edu
// Copyright Min Kyung Kim January 2013. All rights reserved.


// variables
float x, y, wd, ht, easingCoef;
PImage a;
PImage b;
PImage c;
PImage d;

// setup and definitions
void setup ( )
{
  size ( 400, 400 );
  background ( 255 );
  smooth ( );
  
  x = width * .5;
  y = height * .5;
  wd = width * .8;
  ht = height * .8;
  easingCoef = .05;
  
  a = loadImage ("hangeul.jpg");
  b = loadImage ("flag.jpg");
  c = loadImage ("door.jpg");
  d = loadImage ("danchung.jpg");
  
}

void draw ( )
{
  float distX = mouseX - x;
  float distY = mouseY - y;
  
  x = x + (distX * easingCoef);
  y = y + (distY * easingCoef);

// white circle, part 1
  stroke ( 200 );
  strokeWeight (0.2);
  ellipse ( x, y, wd / 2, ht / 2);

// mousePressed 
// circle with colors blue and red
  if (mousePressed == true ) {
    noStroke ( );
    fill ( 102, 102, 255 );
    arc ( x, y, wd / 2, ht / 2, 0, TWO_PI/2 );
    ellipse ( x + 40, y, wd / 4, ht / 4 );
    ellipse ( x - 40, y, wd / 4, ht / 4 );
    ellipse ( x + 40, y, wd / 4, ht / 4 );
    fill ( 255, 102, 102 );
    ellipse ( x - 40, y, wd / 4, ht / 4 );

// white circle, part 2
  } else {
    fill (255, 40);
    stroke (200);
    strokeWeight (0.7);
    arc ( x - 40, y, wd / 4, ht / 4, 0, TWO_PI/2 );
    arc ( x + 40, y, wd / 4, ht / 4, -TWO_PI/2, 0 );
  }

}

// keyPressed
// up, down, left, and right

void keyPressed ( ) {
  if ( key == ' ' ) {
    noStroke ( );
    fill ( 255, 80 );
    rect ( 0, 0, 400, 400);
  } if ( key == 'h' ) {
        background (a);
  } if (key == 'n') {
        background (b);
  } if (key == 'b' ) {
        background (c);
  } if (key == 'm' ) {
        background (d);
  }
} 
  // saveFrame ("HOMEWORK4.jpg");





