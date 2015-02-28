
int ellipseW = 10;
int ellipseL = 50;
int num = 45;

void setup() {
  size(700, 700, P3D);
}

void draw() {

  colorMode(HSB);
  noStroke();
  background(0, 0, 0);
  translate(350, 350);
  
  for (int i=0; i < num; i++) {
    for (int j=0; j < num; j++) {
      fill((i*2+15), (j*2+200), 100, 80);
      pushMatrix();
      rotateX(radians(i*10));
      rotateY(radians(j*10));
      scale (1.2);
      pushMatrix();
      translate(i*returnMouseX(), j* returnMouseY());
      rotateY(radians(returnMouseY()) );  
      rotateX(radians(returnMouseX()) );

      ellipse(0, 0, ellipseW, ellipseL);
      popMatrix();

      popMatrix();
    }
  }
}

float returnMouseX() {
  float myMouseX = map(mouseX, 0, width, -20, 20);
  return myMouseX;
}
float returnMouseY() {
  float myMouseY = map(mouseY, 0, width, -20, 20);
  return myMouseY;
}


