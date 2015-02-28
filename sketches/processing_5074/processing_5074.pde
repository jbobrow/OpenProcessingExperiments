
import processing.pdf.*;

/* 

Rotating Ridge
October, 2009
veronyu@hotmail.com

*/

float turn = 0;
float noiseNum = 0;
void setup() {
  size(500, 500);
  background(20,40,185);
  smooth();
  
  noiseSeed(900);
  
  
  beginRecord(PDF, "name.pdf");
   
};


void draw (){
  pushMatrix();
  translate(width/2,height/2);
  rotate(turn);
  

  float end = noise(noiseNum) * 10000000;
  noiseNum = noiseNum + 0.666666666666666;
  
  stroke(90);
  line(100,10,9000000,10000000);
  ellipse(10,0,3,3);
  
  turn = turn + 0.01;
  
  popMatrix();
  
   pushMatrix();
  translate(width/2,height/2);
  rotate(turn);
  


  noiseNum = noiseNum + 0.33;
  
  stroke(3);
  line(0,0,end,0);
  ellipse(end,0,3,3);
  
  turn = turn + 0.01;
  
  popMatrix();
  
  
};

void mousePressed(){
 
  endRecord();
 
  exit();
  
};

