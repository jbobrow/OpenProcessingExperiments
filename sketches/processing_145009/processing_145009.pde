
void setup(){
  size(800,800,P3D);
  smooth(8);
}
void draw(){
  background(0);
 
  pointLight(255, 0, 0, mouseX, mouseY, 64);
  pointLight(0, 0, 255, width - mouseX, height - mouseY, 64);
 
  noStroke();
  pushMatrix();
    translate(width * 0.5, height * 0.5, -width * 0.25);
    sphere(width * 0.25);
  popMatrix();
}
