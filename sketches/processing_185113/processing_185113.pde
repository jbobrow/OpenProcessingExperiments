
//Week 2 assignment
//Sunny Sharma
//Dms110
//reference:processing.org

  
void setup() {
  size(100,100,P3D);
}

void draw() {
  background(200);
  stroke(255,50);
  translate(50,50,0);
  rotateX(mouseY * 0.05);
  rotateY(mouseX * 0.05);
  fill(mouseX * 2, 0, 160);
  sphereDetail(mouseX / 4);
  sphere(40);
}

