


void setup() {
  size(600, 600, P3D);
  background(255);
}

void draw() {
  background(255);
  noStroke();
  lights();
  
  translate(width/2, height/2);
  
  rotateY((float) mouseX / width * (PI * 2));
  rotateX((float) mouseY / height * (PI * 2));
  
  fill(255, 0, 0, 50);
  box(100);
  
  fill(200, 100, 50, 50);
  box(200);
  
  pushMatrix();
  translate(200, 0, 50);
  fill(0, 0, 255, 50);
  box(150);
  popMatrix();
  
  pushMatrix();
  translate(-100, -100, -100);
  fill(0, 255, 0, 50);
  box(75);
  popMatrix();
  
  pushMatrix();
  translate(-50, -80, 300);
  fill(50, 105, 80, 50);
  box(75);
  popMatrix();
  
  pushMatrix();
  translate(0, -150, 10);
  fill(150, 5, 80, 50);
  box(105);
  popMatrix();
  
  pushMatrix();
  translate(0, -300, 0);
  fill(0, 225, 80, 50);
  box(80);
  popMatrix();
  
  pushMatrix();
  translate(80, 80);
  fill(233, 70, 255, 50);
  box(80);
  popMatrix();
  
  fill(200, 200, 0, 50);
  box(170);
  
  fill(0, 200, 200, 40);
  box(200);
  
  fill(200, 0, 200, 30);
  box(250);
  
  fill(100, 100, 0, 30);
  box(350);
  
  pushMatrix();
  translate(-300, 0, 0);
    fill(200, 200, 0, 50);
  box(170);
  
  fill(0, 200, 200, 40);
  box(200);
  
  fill(200, 0, 200, 30);
  box(250);
  
  fill(100, 100, 0, 30);
  box(350);
  popMatrix();
  
    pushMatrix();
  translate(300, 0, 0);
    fill(200, 200, 0, 50);
  box(170);
  
  fill(0, 200, 200, 40);
  box(200);
  
  fill(200, 0, 200, 30);
  box(250);
  
  fill(100, 100, 0, 30);
  box(350);
  popMatrix();
  
  
      pushMatrix();
  translate(0, 300, 0);
    fill(200, 200, 0, 50);
  box(170);
  
  fill(0, 200, 200, 40);
  box(200);
  
  fill(200, 0, 200, 30);
  box(250);
  
  fill(100, 100, 0, 30);
  box(350);
  popMatrix();

      pushMatrix();
  translate(0, -300, 0);
    fill(200, 200, 0, 50);
  box(170);
  
  fill(0, 200, 200, 40);
  box(200);
  
  fill(200, 0, 200, 30);
  box(250);
  
  fill(100, 100, 0, 30);
  box(350);
  popMatrix();

}

