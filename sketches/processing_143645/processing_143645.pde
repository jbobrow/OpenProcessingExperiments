
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: CHOI Seung-hwan
// ID: 201420112

void setup() {

  size(600, 600);
  background(255);
  smooth();
  noFill();
}

void draw() {

  for (float X=150; X<width*1.666; X+=25) {
    stroke(150);
    strokeWeight(0);
    ellipse (width/2, height/2, X, X);
  }
  
  for (float Y=20; Y<width; Y*=1.06) {
    stroke(50);
    strokeWeight(1);
    ellipse (Y, Y, Y, Y);
    ellipse (Y, 590-Y, Y, Y);
    ellipse (590-Y, Y, Y, Y);
    ellipse (590-Y, 590-Y, Y, Y);
  }
  
}
