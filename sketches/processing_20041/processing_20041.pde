


void setup() {
  size(640, 360, P3D);
  noStroke();
  fill(204);
}

void draw() {
  noStroke(); 
  background(0); 
  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
  
  fill(0, 51, 102); 
  lightSpecular(0,0,0);
  ambientLight(102, 102, 102);
  directionalLight(102, 102, 102, 0, 0, -1); 
  specular(0, 0, 0);
  shininess(2);
  translate(width/2 - 100, height/2, 0); 
  rotateX(PI/3.0);
  sphere(80);
  pushMatrix();
  float ex = map(mouseX, 0, 640,0, 80);
  float wy = map(mouseY, 0, 360,0, 80);
  translate(ex,80,wy);
 
  fill(0, 0, 0); 

  ambientLight(102, 102, 102);
  lightSpecular(204, 204, 204); 
  directionalLight(102, 102, 102, 0, 0, -1); 
  specular(255, 255, 255); 

  shininess(5.0);
   sphere(15);
  popMatrix();
  //rotate(PI/3.0);

 // ambientLight(102,102,102);
  fill(0, 51, 102); 
  lightSpecular(0,0,0);
  ambientLight(102, 102, 102);
  directionalLight(102, 102, 102, 0, 0, -1); 
  specular(0, 0, 0);
  shininess(2);
  translate(200, 0, 0); 
  sphere(80); 
  
  pushMatrix();
  translate(ex-40,80,wy);
  fill(0, 0, 0); 
  ambientLight(102, 102, 102);
  lightSpecular(204, 204, 204); 
  directionalLight(102, 102, 102, 0, 0, -1); 
  specular(255, 255, 255);
  shininess(5.0);
   sphere(15);
  popMatrix();
}



