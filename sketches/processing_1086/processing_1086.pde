
//Simple Globe with Cube
//Code by Björn Zimmermann
//Suggestions are welcome!

float rotx = 0;
float roty = 0;
float cubex = 0;

void setup() {
  size(800,600,P3D);
  //frameRate(30);
}

void draw() {
  background(0);
  
  directionalLight(126, 126, 126, 0, 0, -100);
  ambientLight(255, 102, 126);
  
  rotx += 0.02;
  roty += 0.04;
  
  fill(34,162,240,150);
  stroke(255,100);
  
  pushMatrix();
  translate(width/2, height/2, -200);
  rotateX(sin(rotx)/2);
  rotateY(cos(roty));
  sphere(280);
  popMatrix();
  
  fill(245,199,15,250);
  stroke(0);
  
  pushMatrix();
  cubex += 0.02;
  translate(width/2 + 130 * sin(rotx), height/2 + 130*sin(roty), -300+100*sin(rotx)); 
  //scale(2); 
  rotateX(rotx);
  rotateY(roty);
  box(150);
  popMatrix();
  
}


