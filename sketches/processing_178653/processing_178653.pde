
void setup() {
  noSmooth();
  size(500, 500);
  noFill();
  stroke(255);
}
void draw() {
  background(0);
  for (float i =0; i<width/2+1; i+=0.0005*mouseX * mouseX +.5) {
    ellipse(i, i, i*2, i*2);
    ellipse(width-i, i, i*2, i*2);
    ellipse(i, width-i, i*2, i*2);
    ellipse(width-i, width-i, i*2, i*2);
  }
}

void keyPressed() {
  if ( key == 'e') {
    noSmooth();
  }
  if (key =='r') {
    smooth();
  }
}



