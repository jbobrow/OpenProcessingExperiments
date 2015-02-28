

size(450, 450);

smooth();
background(#51316C);

 
 
int number = 18;


 

for (int i = 0; i<number; i++) {
  for (int j = 0; j<number; j++) {
    // checkerboard pattern BB
    if ((i+j) % 2 == 0) {
      fill(#007DFF,(3*(i+j))%255);  // modified Brad Borevitz Pattern 3 faded fill
      noStroke();
    }
    else {
      stroke(#FFCD00,25-j%255); // translucent gold fading outline
      strokeWeight(4);
      noFill();
    }
    // BB
    rect(i*width/number, j*height/number, width/number, height/number);
  }
}


