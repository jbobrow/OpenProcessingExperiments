
float ballx = 0;
float bally = -50;
float ballz = 0;
float rx = 0;
float ry = 0;
float rz = 0;
 
void setup() {
  size(1000, 500, P3D);
  background(0);
  strokeWeight(.7);
  smooth();
}
 

void draw() {
  background(255, 255, 255);

  translate(500, 350, 0);
  translate(ballx, bally, ballz);
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  fill(255, 255, 255);
  stroke(random(0,266));
  sphere(50);}
  
