
void setup() {
  size(600, 600, P3D);
  noStroke();
}

void draw() {
  background (42,44,46);
  translate(width/2, height/2);
  pointLight(150,100,0,
             250,-150,0);
  directionalLight(0,102,255,
                   1,0,0);
  spotLight(255,255,109,
            0,40,200,
            0,-0.5,-0.5,
            PI/2,2);
  
  rotateY(map(mouseX,0,width,0,PI));
  rotateX(map(mouseY,0,height,0,PI));
  sphere(100);
}
