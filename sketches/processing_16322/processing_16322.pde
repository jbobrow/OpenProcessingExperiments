


float angulo1 = 0;
float angulo2 = 0;

void setup() {
  size(800,800,P3D);
  
  
  background(0);
}

void draw() {
  
  stroke(255,49,218);
 noFill();
  rectMode(CENTER);
  
  pushMatrix(); 
  translate(400,400); 
  rotateZ(angulo1);
   sphere(100);
  popMatrix(); 
  
  pushMatrix();
  translate(400,400); 
  rotateY(angulo2);
  box(100); 
  popMatrix();
  
 angulo1 += 0.02;
  angulo2 += 0.02;
  
  pushMatrix();
  translate(400,400); 
  rotateX(angulo2);
  box(100);
  popMatrix();
  
 angulo1 += 0.02;
  angulo2 += 0.02;
  
 
 
}



