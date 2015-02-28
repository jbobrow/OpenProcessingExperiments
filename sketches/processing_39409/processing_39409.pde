
/* 
 Daniel C. Young
 Ellipses #1
 09/26/2011
 */

// variables
int gap=50;

// setup
size(800, 800);
smooth();
background(255);

// draw
for (int x=50;x<width;x=x+gap) {
  for (int y=50;y<height;y=y+gap) {
    for (int i=gap-5;i>0;i=i-6) {
      ellipse(x, y, i, i);
    }
    arc(x, y, gap, gap, 0, PI/2);
    arc(x, y, gap, gap, PI, 3*PI/2);
  }
}

