
float spin = 0.0;

void setup() {
  size(320, 240, P3D);
  noStroke();
}

void draw() {
  background(51);
  
  if (mousePressed) {
    spin += 0.03;
  } else {
    spin += 0.12;
  }
  
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(PI/5 + spin);
  rotateY(PI/2);
  box(100);
  popMatrix();
}


