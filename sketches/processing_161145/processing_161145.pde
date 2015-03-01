
int value = 0;

void setup() {
  size(600, 600, P3D); 
}

void draw() {
  background(0);
  stroke(255, 50);
  translate(300, 300, 300);
  rotateX(mouseY* 0.05);
  rotateY(mouseX* 0.05);
  fill(mouseX* 2, 0, 160);
  sphereDetail(value / 4);
  sphere(40);
  
  stroke(255, 50);
  translate(100, 200, 100);
  rotateX(mouseY* 0.05);
  rotateY(mouseX* 0.05);
  fill(mouseX* 2, 100, 160);
  sphereDetail(value / 4);
  sphere(50);
  
  stroke(255, 50);
  translate(100, 200, 100);
  rotateX(mouseY* 0.05);
  rotateY(mouseX* 0.05);
  fill(mouseX* 2, 60, 60);
  sphereDetail(value / 4);
  sphere(40);
  
  stroke(255, 50);
  translate(100, 200, 100);
  rotateX(mouseY* 0.05);
  rotateY(mouseX* 0.05);
  fill(mouseX* 2, 0, 90);
  sphereDetail(value / 4);
  sphere(30);
  
  stroke(255, 50);
  translate(100, 200, 100);
  rotateX(mouseY* 0.05);
  rotateY(mouseX* 0.05);
  fill(mouseX* 2, 0, 120);
  sphereDetail(value / 4);
  sphere(20);
  
  stroke(255, 50);
  translate(100, 200, 100);
  rotateX(mouseY* 0.05);
  rotateY(mouseX* 0.05);
  fill(mouseX* 2, 0, 10);
  sphereDetail(value / 4);
  sphere(10);
  
  stroke(255, 50);
  translate(100, 200, 100);
  rotateX(mouseY* 0.05);
  rotateY(mouseX* 0.05);
  fill(mouseX* 2, 0, 5);
  sphereDetail(value / 4);
  sphere(5);
}

void mouseClicked() {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}





