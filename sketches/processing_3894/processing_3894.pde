


float giroX = 0;
float giroY = 0;
float cuboZ = 0;

void setup() {
  size(800,600,P3D);
  
}

void draw() {
  background(0);
  float s = second();
  float m = minute();
  float h = hour();
  

  directionalLight(126, 126, 126, 0, 0, -100);
  ambientLight(255, 102, 126);
  
  giroX += 0.02;
  giroY += 0.04;
  
  fill(#0C11F2);
  noStroke();
  
  pushMatrix();
  translate(width/2, height/2, -200);
  rotateX(sin(giroX)/2);
  rotateY(cos(giroY));
  sphereDetail(20);
  sphere(1.5*s);
  popMatrix();
  
  fill(#F2EB0A);
  noStroke();
  
  pushMatrix();
  cuboZ += 0.02;
  translate(width/2 + 130 * sin(giroX), height/2 + 130*sin(giroY), -300+100*sin(giroX)); 

  rotateX(giroX);
  rotateY(giroY);
    box(1*m);
  popMatrix();
  
  fill(#FA1B03);
  noStroke();
  
  pushMatrix();
  cuboZ += 0.02;
  translate(width/2 + 130 * cos(giroX), height/2 + 130*cos(giroY), -300+100*cos(giroX)); 
  
  rotateX(giroX);
  rotateY(giroY);
    sphereDetail(1);
    sphere(2*h);
  popMatrix();
}


