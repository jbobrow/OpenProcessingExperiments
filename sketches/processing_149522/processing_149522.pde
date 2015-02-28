
void setup() {
  size(400, 400, P3D); 
}

void draw() {
  background(200);
  
  for (int i = 0; i < 4; i++){
     // pushMatrix();
      
  //background(200);
  stroke(255, 50);
  translate(50*i, 50*i, 0);
  rotateX(mouseY * 0.05);
  rotateY(mouseX * 0.05);
  fill(mouseX * 2, 0, 160);
  sphereDetail(mouseX / 4);
  sphere(40);
  
  //popMatrix();
  
  }
}


