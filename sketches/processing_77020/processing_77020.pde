
/*

IxD generative logo

This is a logo for the course of Interaction Design in Venice.
This is an interactive and generative logo, 
so you can move your mouse, on left and right, on top and bottom,
and see how it changes the X element.

Mariasole Piva
19/10/2012

Version 1

*/
void draw() {
  
  if (makePDF) {
    beginRecord(PDF, "file.pdf");
  }
  
  background(0);
  noFill();
  stroke(255);
  rect(35, 45, 30, 150);
  beginShape();
  vertex(250, 45);
  vertex(250, 195);
  vertex(330, 195);
  vertex(355, 175);
  vertex(355, 65);
  vertex(330, 45);
  
  
  endShape(CLOSE);  

  //velocità rotazione
  a += 0.02;

  lights();
  translate(width/2-35, height/2);
  rotateX(a);
  rotateY(a);
  fill(255, 0, 0); 
  noStroke();
  for (int i = 0; i < 2 ; i++) {
    rotateZ(mouseX * 0.01); 
    rotateY(mouseY * 0.01);
    box(100, 20, 20);
  }
  
  
  if(makePDF){
    endRecord();
    makePDF = false;
  }
  
}

void mousePressed(){
  makePDF = true;
}
import processing.pdf.*;


int i = 0;
float a;

boolean makePDF = false;


void setup() {
  size(390, 240, P3D);
  smooth(2);
  
  
  
  
  
}


