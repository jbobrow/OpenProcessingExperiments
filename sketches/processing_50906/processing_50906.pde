
/* 
 Ka Kit Cheong
 Line Pattern v2
 01/28/2012
 */

// variables
int distance = 50;

// setup
size(800, 800);
smooth();
background(0);
stroke(195);
strokeWeight(0.5);
fill(0,100);

// draw
strokeWeight(.5);
for ( int i = 0; i <= width; i += distance) {
  for ( int j = 0; j <= height; j += distance) {
    ellipse(i, j, 5, 5);
    line(i, j, j, height);
    line(width - i, height - j, width - j, 0);
  }
}

