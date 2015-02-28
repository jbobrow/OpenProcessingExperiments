
float angulo1 = 0;
float angulo2 = 0;

void setup() {
  size(800,800,P3D);
}

void draw() {
  background(0);
  stroke(255,49,218);
 noFill();
  rectMode(CENTER);
 
  pushMatrix();
  translate(500,500);
  rotateZ(angulo1);
  rect(0,0,250,250); //prueben con box(100);
  popMatrix();
 
  pushMatrix();
  fill(43,45,134,78);
  translate(250,250);
  rotateY(angulo2);
  box(123);
  rect(0,0,250,250);
  popMatrix();
 
 pushMatrix();
 fill(76,45,123,76);
  translate(250,250);
  rotateX(angulo2);
  rect(0,0,250,250);
  popMatrix();
  
   pushMatrix();
   fill(45,678,87,89);
  translate(500,500);
  rotateY(angulo1);
  box(100);
  rect(0,0,250,250); //prueben con box(100);
  popMatrix();
  
   pushMatrix();
   fill(45,65,67,87);
  translate(500,500);
  rotateX(angulo1);
  rect(0,0,250,250); //prueben con box(100);
  popMatrix();
  
  pushMatrix();
   fill(45,65,67,87);
  translate(500,500);
  rotateX(angulo1);
  box(379);
  triangle(30,9,50,50,9,9); //prueben con box(100);
  popMatrix();
 angulo1 += 0.02;
  angulo2 += 0.02;
} 

