

import processing.opengl.*;

float a = 0.0;
float rSize;  // rectangle size


void setup(){
  size(900, 900, OPENGL);
  rSize = width / 8;  
  noStroke();
  fill(204, 204);
}

void draw(){
  background(25);
  lights();
  translate(width/2, height/2);

  
 a += 0.0005;
  if(a > TWO_PI) { 
    a = 0.0; 
  }

  
  for(int i=0; i<20;i++){
   
  beginShape();
  rotateX(mouseX / float(width) * TWO_PI - PI* a);
  rotateY(mouseY / float(height) * TWO_PI - PI * 1.0 * a);
  rect(-rSize, rSize, rSize*1.5, rSize*1.5);
  
  endShape(CLOSE);

      
//VERVIELFÄLTIGEN UND BEWEGEN
rotate(radians(20));// rotate
translate(0,-20,0);// verschieben
  }
 }


