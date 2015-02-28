
void setup () {
  size(500, 500);
}

void draw () {
  background(0);
  stroke(255);
  noFill();
  strokeWeight(1);

  for (int i=0; i<width; i+=10) {
    for (int j=0; j<60; j++) {
      line(i, j, 100*i, 40*j);
      line(i+2, j+20, i/2, j*10);

      if ( j>=10) {
        stroke(255,50);
      }
      else {
        stroke(255, 0, 0, 10);
      }
    }
  }
}



