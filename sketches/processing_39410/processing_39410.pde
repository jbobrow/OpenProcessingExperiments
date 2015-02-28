
/* 
 Daniel C. Young
 Ellipses #2
 09/26/2011
 */

// variables
int gap=25;

// setup
size(800, 800);
smooth();
background(0);
noStroke();

// draw

for (int i=8;i>0;i--) {
  if (i%2==0) {
    fill(255);
  }
  else {
    fill(0);
  }
  ellipse(560-(gap*i/2), 180, gap*i, gap*i);
}

for (int i=16;i>0;i--) {
  if (i%2==0) {
    fill(255);
  }
  else {
    fill(0);
  }
  ellipse(100+(gap*i/2), 400, gap*i, gap*i);
}

for (int i=24;i>0;i--) {
  if (i%2==0) {
    fill(255);
  }
  else {
    fill(0);
  }
  ellipse(560, 400+(gap*i/2), gap*i, gap*i);
}



