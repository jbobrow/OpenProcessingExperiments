
/* 
 Daniel C. Young
 Lines #2
 09/26/2011
 */

// variables
int gap=50;

// setup
size(800, 800);
smooth();
background(0);

// draw
for (int x=0;x<width+gap;x=x+gap) {
  for (int y=0;y<height+gap;y=y+gap) {
    stroke(255);
    line(0, y, x, 0);
    line(x, height, width, y);
  }
}


