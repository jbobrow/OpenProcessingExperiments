

float angle = 0.0;

void setup() {
  size(500,500);
  smooth();
  colorMode(RGB,50,500,500,500);
  background(50,500,500);
  cursor(CROSS);
}

void draw() {
  if (mousePressed == true) {
    stroke(abs(mouseY-pmouseX),400,mouseX, 200);
    pushMatrix();
      translate(mouseX, mouseY);
      rotate(angle);
      line(0,0, 300, 0);
    popMatrix();
    
  angle += 0.02;
  }
}

