
import processing.pdf.*;

float angulo1 = 0;
float angulo2 = 0;
int a = 2;
int b = 4;
int c = 2;
void setup() {
  size(800,800,P3D);
 
  
}

void draw() {
  
   background(0);
 
  stroke(250,89,8);
  noFill();
  rectMode(CENTER);
  

  pushMatrix();
  translate(500,500);
  rotateZ(angulo1);
 



  sphere(random(28,30)); //prueben con box(100);
  
  popMatrix();


  beginShape();
  curveVertex(84,  91);
  curveVertex(500,  500);
  curveVertex(68,  19);
  curveVertex(121,  17);
  curveVertex(500, 500);
  curveVertex(32, c);
  endShape();
  
 
  beginShape();
  curveVertex(84,  91);
  curveVertex(500,  500);
  curveVertex(c,  19);
  curveVertex(121,  117);
  curveVertex(500, 500);
  curveVertex(32, b);
  endShape();
  
  
  beginShape();
  curveVertex(84,  91);
  curveVertex(500,  500);
  curveVertex(b,  19);
  curveVertex(b,  17);
  curveVertex(500, 500);
  curveVertex(c, 100);
  endShape();
  
  
  beginShape();
  curveVertex(84,  91);
  curveVertex(500,  500);
  curveVertex(c,  b);
  curveVertex(21,  17);
  curveVertex(500, 500);
  curveVertex(32, 100);
  endShape();
  
  
  beginShape();
  curveVertex(84,  91);
  curveVertex(500,  500);
  curveVertex(b,  19);
  curveVertex(21,  17);
  curveVertex(500, 500);
  curveVertex(32, 100);
  endShape();
  
  
  beginShape();
  curveVertex(84,  91);
  curveVertex(500,  c);
  curveVertex(c,  19);
  curveVertex(21,  17);
  curveVertex(500, 500);
  curveVertex(32, 100);
  endShape();
  
  
  beginShape();
  curveVertex(84,  91);
  curveVertex(500,  500);
  curveVertex(1,  19);
  curveVertex(21,  17);
  curveVertex(500, 500);
  curveVertex(32, 100);
  endShape();
  
  
  beginShape();
  curveVertex(84,  91);
  curveVertex(500,  500);
  curveVertex(68,  19);
  curveVertex(21,  17);
  curveVertex(500, 500);
  curveVertex(32, 100);
  endShape();
  
  
  beginShape();
  curveVertex(84,  91);
  curveVertex(500,  500);
  curveVertex(68,  19);
  curveVertex(21,  17);
  curveVertex(500, 500);
  curveVertex(32, 100);
  endShape();
  
  
  beginShape();
  curveVertex(84,  91);
  curveVertex(500,  500);
  curveVertex(68,  19);
  curveVertex(21,  17);
  curveVertex(500, 500);
  curveVertex(32, 100);
  endShape();
  
  
  beginShape();
  curveVertex(84,  91);
  curveVertex(500,  500);
  curveVertex(68,  19);
  curveVertex(21,  17);
  curveVertex(500, 500);
  curveVertex(32, 100);
  endShape();
  
  
  beginShape();
  curveVertex(84,  91);
  curveVertex(500,  500);
  curveVertex(68,  c);
  curveVertex(b,  17);
  curveVertex(500, 500);
  curveVertex(32, 100);
  endShape();
  
  
  beginShape();
  curveVertex(84,  91);
  curveVertex(500,  500);
  curveVertex(68,  c);
  curveVertex(a,  17);
  curveVertex(500, 500);
  curveVertex(32, 100);
  endShape();
  
  
  beginShape();
  curveVertex(c,  91);
  curveVertex(500,  500);
  curveVertex(68,  19);
  curveVertex(21,  17);
  curveVertex(500, 500);
  curveVertex(32, 100);
  endShape();

  a = a + 4;
  b = b +3;
  c = c -3;
  
  angulo1 += 0.01;
  angulo2 += 0.02;
  

}


