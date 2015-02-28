
/*
 Ka Kit Cheong 
 Circle Pattern V2
 01/30/2012
 */

// variables
int count = 36;
int distance = 40;

// setup
size(600, 600);
smooth();
noFill();
strokeWeight(0.6);
background(40);

// draw
for (int i=0; i<=width; i+=distance) {
  for (int j=count; j>0; j--) {
    if (j%2 == 0) {
      stroke(105);
      ellipse(i, i, j*distance, j*distance);
    } 
    else {
      stroke(255);
      ellipse(i+(distance/2), i, j*distance, j*distance);
    }
  }
}


