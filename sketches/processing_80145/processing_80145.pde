
import processing.pdf.*;

void setup(){
size(1000,600);
beginRecord(PDF,"imagen4.pdf");
background(255);
//strokeWeight(2);
noFill();
smooth();
}

void draw(){
  stroke(0,100);
  for(int a=-200; a<height; a+=100){
 for (int b=-200; b<width; b+=100){

beginShape();
curveVertex(b,a);
curveVertex(b+600,a+400);
curveVertex(b+200,a+100);
curveVertex(b+800,a+200);
curveVertex(b+700,a+100);
curveVertex(b+100,a+0);
endShape();
fill(16,3,162,50);
beginShape (TRIANGLE_FAN);
vertex (b+900,a+400);
vertex (b+500,a+200);
vertex (b+600,a+100);
fill(255,3,3,20);
ellipse(500,250,b-500,a-500);
fill(16,3,162,50);
vertex (b,a);
vertex (b+300,a+500);
vertex (b+600,a+0);



 }
  }
  endRecord();
}

