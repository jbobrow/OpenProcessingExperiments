

void setup() {
  size(450, 450);
  smooth();
}
//used float instead of int because it is not a whole number
void draw() {
  background(255);
  //for solid green circles
  fill(125, 165, 105);
  stroke(255);
  for (float c=.5;c<10;c++) {
    for (float r=.5;r<10;r++) {
      noStroke();
      ellipse(r*45, c*45, 45, 45);
    }
  }
  //use of a function
  for (int c=1;c<20;c++) {
    for (int r=1;r<20;r++) {
      DrawLoops(r, c);
    }
  }
  for (float c=.5;c<9;c++) {
    for (float r=.5;r<9;r++) {
      //for grey points
      strokeWeight(8);
      stroke(153, 170, 170);
      point(r*45+22.5, c*45+22.5);
    }
  }
}
//to draw the opac circles, I created a function.
void DrawLoops(int r, int c) {
  strokeWeight(3);
  stroke(255, 100);
  noFill();
  ellipse(r*22.5, c*22.5, 50, 50);
}


