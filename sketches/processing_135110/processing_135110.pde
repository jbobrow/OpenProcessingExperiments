
float rotx;
float rotz= PI/2;

float inc = .05;
void setup() {
  size(540,540,P3D);
}
void draw() {
translate(width/2,height/2);
rotateX(rotx+radians(-mouseY/3));
rotateZ(rotz+radians(mouseX/3));
  background(0);
  fill(255,0,0);
  sphere(100);
  


}


