
void setup(){
  size(500, 500, P3D);
  background(0, 255, 249);
}

void draw(){
  if(mousePressed){;
  stroke(150);
  translate(mouseX, mouseY);
  rotateY(mouseX);
  rotateX(mouseY);
  fill(255, 153, 0);
     box(45);
   noFill();
  stroke(0, 0, 100, 20);
  sphere(75);
  sphere(25);
  fill(0, 255, 202);
  translate(mouseX, mouseY);
  stroke(255, 153, 0);
  box(100);
  }
}
