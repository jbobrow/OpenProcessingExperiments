
/* 
 Daniel C. Young
 Bezier #1
 09/26/2011
 */

// variables
int gap=25;

// setup
size(800, 800);
smooth();
background(255);
noFill();


// draw
for (int x=0;x<width;x=x+gap) {
  for (int y=0;y<width;y=y+gap) {
    stroke(y/60,30);
    strokeWeight(y/20);
    bezier(x, y, x*gap, y*gap, height/2, width/2, height, width);
  }
}


