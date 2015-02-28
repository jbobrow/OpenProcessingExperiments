
float rad = radians (10) ;
 
  
void setup() {
  size(400, 400, P3D);
  noStroke();
}
  
void draw() {
  background(255);
  shininess(3);
  ambientLight(100, 100, 100);
  lightSpecular(100, 100, 100);
  directionalLight(200, 50, 105, 50, 0, -1);
  specular(255, 255, 255);
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0)-45, width/2.0, height/2.0, 0, 0, 1, 0);
  rotateY(radians((mouseX/(float)width*180)-90));
  rotateX(radians((mouseY/(float)height*180)-90));
  
  fill(255, 153, 204);
  rad++;
  translate(200, 130);
  rotateY(radians(rad)-90);
  box(100);
  pushMatrix();
  translate(80, 140);
  fill(255, 202, 202);
  box(30);
  
  popMatrix();
  pushMatrix();
  translate(50, 140);
  fill(random(255), 255, 143);
  box(30);
  popMatrix();
  
  pushMatrix();
  translate(-50, 0, 30);
  
  fill(random(255));
  box(15);
  popMatrix();
  
  
  
  pushMatrix();
  translate(-50, 0, -30);
  fill(random(255));
  box(15);
  popMatrix();
  
  pushMatrix();
  translate(0, -60, 0);
  fill(random(255));
  box(30);
  rotateZ(radians(random(20)));
  popMatrix();
  
  
  pushMatrix();
  translate(0, 130, 0);
  fill(255, 153, 153);
  box(100, 130, 100);
  popMatrix();
  
 //hand
  pushMatrix();
  translate(-20, 120, -70);
  fill(255, 200, 200);
  rotateZ(radians(sin(frameCount/10)*50));
  box(30, 100,40);
  popMatrix();
   
 //hand
  pushMatrix();
  translate(-10, 120, 70);
  fill(255, 200, 200);
  rotateZ(radians(sin(frameCount/10)*50));
  box(30, 100, 40);
  popMatrix();
  
  
  
  pushMatrix();
  translate(0, 220, 20);
  fill(255, 204, 204);
   rotateZ(radians(sin(frameCount/10)*50));
  box(50, 50, 25);
  popMatrix();
  
  pushMatrix();
  translate(0, 250, 20);
  fill(255, 102, 102);
   rotateZ(radians(sin(frameCount/10)*50));
  box(30, 20, 20);
  popMatrix();
  
  
  
  pushMatrix();
  translate(0, 70);
  fill(255, 102, 102);
  box(50);
  popMatrix();
  
  
  
  pushMatrix();
  translate(0, 220, -20);
  fill(255, 204, 204);
   rotateZ(radians(sin(frameCount/10)*50));
  box(50, 50, 25);
  popMatrix();
  pushMatrix();
  
  translate(0, 250, -20);
  fill(255, 102, 102);
   rotateZ(radians(sin(frameCount/10)*50));
  box(30, 20, 20);
  popMatrix();
}

