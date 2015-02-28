
import processing.pdf.*;

void setup(){
  size(900,500);
  beginRecord(PDF,"imagen5.pdf");
  background(0);
  
  smooth();
}


void draw(){
  stroke(10,28,173,100);
  strokeWeight(2);
  fill(255,3,3,50); 
  triangle(0,0,450,500,0,500);
  triangle(900,0,450,500,900,500);
  triangle(0,0,450,300,0,400);
  triangle(900,0,450,300,900,400);
  triangle(0,0,450,100,0,300);
  triangle(900,0,450,100,900,300);
  triangle(0,0,450,0,0,200);
  triangle(900,0,450,0,900,200);
  
 for( int a=100;  a<width; a+=50){
   for( int b=50; b<height; b+=50){
     for( int c=800;  a<width; a+=50){
   for( int d=250; b<height; b+=50){
     
  
beginShape();
curveVertex(900,500);
curveVertex(900,500);
curveVertex(a,b);
curveVertex(c,d);
curveVertex (a,d);
curveVertex (c,b);
curveVertex(0,0);
curveVertex(0,0);
endShape();


beginShape();
curveVertex(900,0);
curveVertex(900,0);
curveVertex(a,b);
curveVertex(c,d);
curveVertex (a,d);
curveVertex (c,b);
curveVertex(10,500);
curveVertex(0,500);
endShape();
  }
    }
 }
 }
 endRecord();
}

