
import processing.pdf.*;

float a=0;

void setup(){

 size (500,500);
//beginRecord(PDF, "PDF.pdf");
 smooth();

background(255);
}


void draw(){
  
  stroke (35,0,27);
  noFill();
  rectMode(CENTER);
  
while(a<=500){

  beginShape();
  curveVertex (random(-100,width+100),random(-100,width+100));
  curveVertex (random(-100,width+100),random(-100,width+100));
  curveVertex (random(-100,width+100),random(-100,width+100));
  curveVertex (random(-100,width+100),random(-100,width+100));
  curveVertex (random(-100,width+100),random(-100,width+100));
  endShape(); 


a = a+1;


}
endRecord();
}




