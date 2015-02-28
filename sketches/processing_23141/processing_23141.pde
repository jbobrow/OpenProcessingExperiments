

float angulo1 = 0;
float angulo2 = 0;
float angulo3 = 0;

void setup() {
  size(800,800,P3D);
}

void draw() {
  background(0);
  stroke(55,122,56);
 noFill();
  rectMode(CENTER);
 
  pushMatrix();
  translate(500,500);
  rotateZ(mouseX);
  rect(0,0,250,250); //prueben con box(100);
 
  popMatrix();
 
  pushMatrix();
  translate(250,250);
  rotateY(angulo2);
  rotateZ(angulo1);
  rect(0,0,250,250);
  ellipse (200,200,200,200);
  popMatrix();
  
  
  pushMatrix();
  translate(250,250);
  rotateX(angulo3); 
  ellipse (0,0,200,200);
  popMatrix();
  
  pushMatrix();
  translate(500,500);
  rotateX(angulo1);

  box (100);
  popMatrix();
  
  pushMatrix();
  translate(500,500);
  rotateZ(angulo1);

  box (100);
  popMatrix();
 
 pushMatrix();
  translate(500,500);
  rotateX(angulo3);
  rotateY (angulo3);
  
  box (100);
  popMatrix();
  
  pushMatrix();//limita translate
  translate(200,500); 
  rotateX(angulo1);
  rotateY (angulo1);
   sphere (150);
  popMatrix();
 
 
 angulo1 += 0.02;
  angulo2 += 0.02;
   angulo3 += 0.05;
}



