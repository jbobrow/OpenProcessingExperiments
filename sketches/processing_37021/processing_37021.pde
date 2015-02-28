
size(600, 400);
int number = 10;
ellipseMode(CORNER);
for (int i = 0; i<number; i++) {
  for (int j = 0; j<number; j++) {
    if (j%2==0) {
      if (i%2==0) {
        fill(0);
      }
      else {
        fill(255);
      }
    }
    ellipse(i*width/number, j*height/number, width/number, height/number);
  }
}


