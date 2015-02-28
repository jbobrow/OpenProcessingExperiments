
void setup() {
  fill(30,96,100);
  size(1000, 500,P3D);

}


void draw() {
 
  background(0);
  stroke(255, 250);
  translate(500, 250, 0);
  rotateX(mouseX * 0.05);
  rotateY(mouseY * 0.05);
  fill(0,5,2,9);
  sphereDetail(mouseY / 10);
  sphere(500);
  
  background(0);
  stroke(255, 50);
  translate(130, 130, 0);
  rotateX(pmouseY * 0.05);
  rotateY(mouseX * 0.05);
  sphereDetail(mouseX / 5);
  sphere(250);
   
  fill(0,23,90);
  noStroke();
  ambientLight(200, 102, 102);
  lightSpecular(204, 204, 204); 
  directionalLight(120, 120, 102, 0, 0, -1); 
  specular(255, 255, 255); 
  translate(30, 50, 0); 
  shininess(5.0);
  
  float fov = PI/3.0;
  float cameraZ = (height/2.0) / tan(fov/2.0);
  perspective(fov, float(250)/float(250), 
            cameraZ/10.0, cameraZ*10.0);
  translate(50, 50, 0);
  rotateX(mouseX/6);
  rotateY(mouseY/3);
  box(45);
  
  fill(134,56,9);
  perspective(fov, float(250)/float(250), 
            cameraZ/20.0, cameraZ*20.0);
  translate(50, 50, 0);
  rotateX(mouseX/7);
  rotateY(mouseY/4);
  box(60);
  
  fill(13,56,9);
  perspective(fov, float(250)/float(250), 
            cameraZ/15.0, cameraZ*20.0);
  translate(50, 50, 0);
  rotateX(mouseX/7);
  rotateY(mouseY/4);
  box(30);
}

void mouseMoved(){
  float fov = PI/3.0;
  float cameraZ = (height/2.0) / tan(fov/2.0);
  perspective(fov, float(250)/float(250), 
            cameraZ/10.0, cameraZ*10.0);
  translate(50, 50, 0);
  rotateX(mouseX/6);
  rotateY(mouseY/3);
  box(45);
  
  fill(78,56,24);
  perspective(fov, float(250)/float(250), 
            cameraZ/15.0, cameraZ*20.0);
  translate(50, 50, 0);
  rotateX(mouseX/7);
  rotateY(mouseY/4);
  box(30);
  
  background(0);
  stroke(255, 50);
  translate(130, 130, 0);
  rotateX(pmouseY * 0.05);
  rotateY(mouseX * 0.05);
  sphereDetail(mouseX / 5);
  sphere(50);
  
}

  

