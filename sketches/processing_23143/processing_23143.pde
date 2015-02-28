


void setup (){size(800, 500, P3D);
}

void draw (){
  noFill();
float fov = PI/3.0;
float cameraZ = (height/2.0) / tan(fov/2.0);
perspective(fov, float(width)/float(height), 
            cameraZ/10.0, cameraZ*10.0);
translate(mouseX, mouseY, 0);
rotateX(-PI/6);
rotateY(PI/3);
box(45);}

  
  void keyPressed (){
  background (128);}

