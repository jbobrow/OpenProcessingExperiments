
void setup()  {
  size(640, 360, P3D);
  noStroke();
  fill(12,133,30);
}

void draw()  {
  background(0);
  lights();
    float fov = PI/3.0; 
    float cameraZ = (height/2.0) / tan(fov/2.0); 
    perspective(fov, float(mouseX)/float(mouseY), mouseX,mouseY,cameraZ/2.0, cameraZ*2.0); 
 
  translate(width/2, height/2, 0);
  rotateX(-PI/6); 
  rotateY(PI/3); 
  box(160); 
}
