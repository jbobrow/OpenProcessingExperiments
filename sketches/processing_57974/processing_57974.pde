
//elizabeth ibarra
//used processing.com 
import processing.opengl.*;

float a;

		
void setup() {
  size(700, 700, OPENGL,P3D);
  mouseClicked();   
  
}



void draw() {
  


  
  background(0);



  
  pushMatrix();
  smooth();
  stroke(3,250,248);



 
 
  translate(300,300);
  rotateY(a*2);
  box(100);
  popMatrix();
  
  pushMatrix();
  smooth();
  background(0);
  noStroke();
  background(0);
  fill(0, 51, 102);
  lightSpecular(205, 205, 205);
  directionalLight(204, 204, 204, 0, 0, -1);
  translate(20, 50, 0);
  specular(39,214,37);
  translate(400, 100); 
  rotateY(a);
  box(200);
  popMatrix();

  pushMatrix();
  translate(500,300); 
  rotateY(a*3);
  box(50);
  popMatrix();
  
   pushMatrix();
  translate(500,400); 
  
  rotateY(a*4);
  box(130);
  popMatrix();
  
  pushMatrix();
  translate(500,0); 
  rotateY(a/2);
  box(30);
  popMatrix();
  
  pushMatrix();
  translate(0,400); 
  rotateY(a*5);
  box(300);
  popMatrix();
  
   pushMatrix();
  translate(40,40); 
  rotateY(a*2);
  box(20);
  popMatrix();
  
  pushMatrix();
  translate(500,500); 
  rotateY(a*5);
  box(20);
  popMatrix();
  
  pushMatrix();
  translate(600,600); 
  rotateY(a*5);
  box(170);
  popMatrix();
  
  pushMatrix();
  translate(0,170); 
  rotateY(a*7);
  box(40);
  popMatrix();
  
  pushMatrix();
  translate(90,90); 
  rotateY(a*4);
  box(70);
  popMatrix();
  
    pushMatrix();
  translate(300,400); 
  rotateY(a*2);
  box(90);
  popMatrix();
  
  pushMatrix();
  translate(600,270); 
  rotateY(a*7);
  box(20);
  popMatrix();
  
  pushMatrix();
  translate(190,600); 
  rotateY(a*4);
  box(10);
  popMatrix();
  
   pushMatrix();
  translate(300,600); 
  rotateY(a*6);
  box(60);
  popMatrix();
  
  pushMatrix();
  translate(300,270); 
  rotateY(a*2);
  box(20);
  popMatrix();
  
  pushMatrix();
  translate(10,300); 
  rotateY(a*5);
  box(30);
  popMatrix();
  
   pushMatrix();
  translate(350,400); 
  rotateY(a*6);
  box(15);
  popMatrix();
  a += .001;
}


