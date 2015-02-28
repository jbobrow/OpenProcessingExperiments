
//import processing.opengl.*;

void setup() {
  size(890,567,P3D);
  
  noStroke();
  fill(255,1);
}

void draw() {
  frame.setTitle(""+frameRate);
  
  ambient(255,255,255);
  emissive(0,0,0);
  
  lightSpecular(68,0,0);
  shininess(20);
  directionalLight(68,50,96,0,.3,-1);
  
  
  fill(255,1);
  hint(DISABLE_DEPTH_TEST);
  pushMatrix();
  translate(0,0,150);
  scale(-1);
  sphere(800);
  popMatrix();
  hint(ENABLE_DEPTH_TEST);
  
  fill(255,5);
  noLights();
  
  lightSpecular(255,0,0);
  directionalLight(50,20,20,1,0,-1);
  lightSpecular(0,255,0);
  directionalLight(20,50,20,-1,0,-1);
  lightSpecular(255,255,255);
  directionalLight(50,50,50,0,0,-1);
  specular(255,255,255);
  shininess(20);
  
  pushMatrix();
  translate(width/3,height/2);
  rotateX(cos(frameCount*.01));
  rotateY(sin(frameCount*.01));
  rotateZ(-sin(frameCount*.01));
  sphere(100);
  popMatrix();
  
  pushMatrix();
  translate(width-width/3,height/2);
  rotateY(cos(frameCount*.01));
  rotateZ(sin(frameCount*.01));
  rotateX(-sin(frameCount*.01));
  box(100);
  rotateZ(QUARTER_PI);
  rotateY(QUARTER_PI);
  rotateX(QUARTER_PI);
  box(100);
  rotateZ(QUARTER_PI);
  rotateY(QUARTER_PI);
  rotateX(QUARTER_PI);
  box(100);
  popMatrix();
  
}

