


void setup() {
  int canvasHeight = 600;
  int canvasWidth = 600;
  size(600, 600, P3D);
  stroke(255);
  //noStroke();
}

void draw() {
  background(0);
  translate(height/2, width/2);
  rotateX(mouseY*0.01);
  rotateY(mouseX*0.01);
  for (int i = 0; i < 100; i++) {
    pushMatrix();
    translate(i*0.25*10, i*10);
    rotateX(PI*i*0.25/2);

    fill(100);
    rect(0, 0, 50, 50);
    popMatrix();
  }
}


