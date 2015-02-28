
/*

Fat Toy
veronyu@hotmail.com
October, 2009

*/

void setup(){
  size(700, 500,P3D);
  background(0);
 
};

void draw() {
  background(0);
  noStroke();
  lights();
  translate(width/2, height/2);
  
  rotateX((float)mouseX/width*(PI * 2));
  rotateY((float)mouseY/width*(PI * 2));

  
  
  fill(55, 200, 0);
 sphere(100);
  
  pushMatrix();
 
   translate(20,0);
  fill(255,100,100);
  sphere(100);
  
  popMatrix();
  pushMatrix();
  
 
  translate(-20,0);
  fill(255,100,100);
  sphere(100);
  
  popMatrix();
  
  pushMatrix();
  
  
  translate(40,0);
  fill(55,100,100);
  sphere(100);
  
  popMatrix();
  
  
  pushMatrix();
  
  
  popMatrix();
  
   pushMatrix();
  
 
  translate(-50,0);
  fill(55,100,100);
  sphere(100);
  
  popMatrix();
  
   pushMatrix();
 
  translate(-150,0);
  fill(45,100,100);
  sphere(100);
  
  popMatrix();
  
   pushMatrix();
  
  
  translate(-90,0);
  fill(255,100,100);
  sphere(100);
  
  popMatrix();
  
  
};








