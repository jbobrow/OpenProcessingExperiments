




void setup() {

  size (600, 600,P3D);
  smooth ();
  noStroke();
}

void draw() {

  background (0);

  lights();
  

  pushMatrix();
  translate (mouseX, mouseY);
  rotateX (mouseX*0.01);
  rotateY (mouseY*0.01);
  box (150);
  popMatrix();
}

void mousePressed() {
  fill (random(255), random(255), random (255));
}

