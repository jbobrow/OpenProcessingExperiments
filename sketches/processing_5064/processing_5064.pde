
import processing.pdf.*;

/* 

Amplifier Texture
September, 2009
veronyu@hotmail.com

*/

float turn = 0;
float noiseNum = 25;
void setup() {
  size(1000, 1000);
  background(255);
  smooth();
  
  noiseSeed(10);
  
 
  beginRecord(PDF, "name.pdf");
   
};


void draw (){
  pushMatrix();
  translate(width/2,height/2);
  rotate(turn);
  
  float end = noise(noiseNum) * 10000;
  noiseNum = noiseNum + 0.01;
  
  stroke(0,900);
  line(0,0,end,0);
  ellipse(end,0,7,7);
  
  turn = turn + 0.01;
  
  popMatrix();
  
};

void mousePressed(){
  endRecord();
  exit();
  
};

