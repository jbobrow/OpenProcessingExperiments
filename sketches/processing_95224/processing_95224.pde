
void setup() {
  size (800, 800, P3D);
}

void draw() {
  background(0);
  camera(mouseX, mouseY, 120.0, width/2, height/2, 0.0, 0.0, 1.0, 0.0);


  pushMatrix();

  color c1= #ffcc00;
  noStroke();
  lights();
  fill(c1);
  
  for (int i = 0; i< 20; i++) {

    translate(i+15, i+15);

    pushMatrix();

    translate(20, 20);
    float rotVal = map(mouseX, mouseY, width, 0, 2*PI);
    rotateX(rotVal);
    rotateY(rotVal);
    box(20+i, 20+i, 20+i);

    popMatrix();
  }

  popMatrix();

  pushMatrix();
  
  stroke(255);
  noFill();
  translate (200, 200, 0);

  for (int j = 0; j< 5; j++) {
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i<4; i++) {
      vertex( i*40, j*40, 0);
      vertex( i*40, (j+1)*40, 0);
    }
    endShape();
  }
  sphere(100);
  popMatrix();
}
