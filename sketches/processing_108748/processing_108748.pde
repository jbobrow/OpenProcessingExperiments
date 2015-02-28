
// ilustra o uso de transformações geométricas


void setup() {
  //noLoop();
}

void draw() {
  background(0);
  quad(50, 50, 50, 60, 60, 70, 70, 80);
  
  
  pushMatrix();
  translate(45, 45);
  rotate(-map(mouseX, 0, width, 0, 2*PI));
  fill(255, 255, 0);
  quad(0, 0, 0, 10, 10, 20, 20, 30);
  ellipse(20,30,10,10);
  popMatrix();
  
  
  rotate(-map(mouseX, 0, width, 0, 10*PI));
  fill(0, 255, 255);
  quad(0, 0, 0, 10, 10, 20, 20, 30);
}
