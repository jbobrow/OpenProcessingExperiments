
/*

ACCD Summer 2012
ID02
Final Progress
Charlene Chen
08/17/2012

Instructor: Michael Kontopoulos
TA: Kit Cheong

*/


Structure s;

float angle;

void setup() {
  size(900, 600);
  smooth(); 

 s = new Structure( 0, 0);
}

void draw() {
  background(255);
  
  pushMatrix();
  
  translate(width/2, height/2);
  
  angle += random(0.001);
  rotate(angle);
  s.display();
  s.update();
  
  popMatrix();

}

