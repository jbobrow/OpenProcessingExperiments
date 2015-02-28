
float sphereAngleY, sphereAngleX;

void setup() {
  size(600, 600, P3D);
  frameRate(30);
  smooth();
  
  sphereAngleY = sphereAngleX = 0;
}

void draw() {
  background(255);
  
  pushMatrix();
  translate(width/2, height/2);
  rotateY(sphereAngleY);
  rotateX(sphereAngleX);
  fill(20,80,200,255);
  sphereDetail(2);
  sphere(100);
  popMatrix();
}

void mouseDragged(){
  if(pmouseX > mouseX){
    float speed = abs(pmouseX-mouseX);
    sphereAngleY -= speed*0.01;
  }
  if(pmouseX < mouseX){
    float speed = abs(pmouseX-mouseX);
    sphereAngleY += speed*0.01;
  }
}

