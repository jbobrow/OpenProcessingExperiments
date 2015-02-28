
void setup() {
  size(500, 500, P3D); 
  noStroke();
  background(204);
}

void draw() {

  if (mousePressed) {
    background(0);
    pointLight(255, 255, 255, mouseX, mouseY, 200);
  }
  else {
    background(204);
  }
  translate(125, 250, 0);
  sphere(100);
  translate(250, 0, 0);
  rotateY(120);
  rotateX(120);
  box(100,100,100);
   
}


