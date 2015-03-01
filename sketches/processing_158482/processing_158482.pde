
void setup() {
  size(600, 600);
  float rotacion = 0.01;
  float tamano = random (100);
  background(0);
}
void draw() {
 
  if (mousePressed) {
    float tamano = random (100);
    colorMode(HSB);
    rotateX(5);
    rotateY(4);
 
 
    noStroke();
    smooth();
    fill(0, 10);
    rect(0, 0, 600, 600);
    fill(120, 0, 255);
    ellipse(mouseX, mouseY, tamano*1.2, tamano);
    ellipse(mouseY, mouseX, tamano*1.2, tamano);
    ellipse(width-mouseX, height-mouseY, tamano*1.2, tamano);
    ellipse(width-mouseY, height-mouseX, tamano*1.2, tamano);
    ellipse(mouseX, height-mouseY, tamano*1.2, tamano);
    ellipse(height-mouseX, mouseY, tamano*1.2, tamano);
    ellipse(height-mouseY, mouseX, tamano*1.2, tamano);
    ellipse(mouseY, height-mouseX, tamano*1.2, tamano);
 
    fill(80);
    ellipse(mouseX, mouseY, tamano*1./2, tamano/2);
    ellipse(mouseY, mouseX, tamano*1.2/2, tamano/2);
    ellipse(width-mouseX, height-mouseY, tamano*1.2/2, tamano/2);
    ellipse(width-mouseY, height-mouseX, tamano*1.2/2, tamano/2);
    ellipse(mouseX, height-mouseY, tamano*1.2/2, tamano/2);
    ellipse(height-mouseX, mouseY, tamano*1.2/2, tamano/2);
    ellipse(height-mouseY, mouseX, tamano*1.2/2, tamano/2);
    ellipse(mouseY, height-mouseX, tamano*1.2/2, tamano/2);
  }
}

