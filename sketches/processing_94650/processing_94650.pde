
float dx;
float dy;
void setup() {
  size(500, 500, P3D);
  sphereDetail(15);
}
void draw() {
  background(255);
  if(mousePressed) {
  dx+=radians(mouseY-pmouseY);
  dy+=radians(mouseX-pmouseX);
  }
  pushMatrix();
  translate(width/2, height/2);
    rotateX(dx);
  rotateY(dy);
  sphere(150);
  for(int i = 0; i < 360/15; i++) {
    rotate(radians(15));
    for(int x = 0; x < 360/15; x++) {
      pushMatrix();
      translate(0, sin(radians(x*15))*200, cos(radians(x*15))*200);
      rotateX(-dx);
      rotateY(-dy);
      ellipse(0, 0, 10, 10) ;
      popMatrix();
    }
  }
  popMatrix();
}
