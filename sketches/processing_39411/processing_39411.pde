
/* 
 Daniel C. Young
 Rectangles #1
 09/26/2011
 */

// variables
int gap=10;

// setup
size(800, 800);
smooth();
background(80);
noStroke();

// draw
for (int i=width-gap;i>0;i=i-gap) {
  if (i%20==0) {
    fill(255);
  }
  else {
    fill(0);
  }
  rect(width/4, height/4, i/2, i/2);
  rotate(10);
}


