
void setup(){
  size (800, 600, P3D);
}

void draw(){
  background(0);
  noFill();
  stroke(0);
  strokeWeight(1);
  translate(mouseX, mouseY);
  rotateY(frameCount * 0.01);
  //sphere(100);
  stroke(255, 190, 0, 30);
  strokeWeight(120);
  sphere(200);
}
  

