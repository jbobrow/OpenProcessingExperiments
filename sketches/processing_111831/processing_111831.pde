

import processing.pdf.*;
 
boolean recording;
PGraphicsPDF pdf;
 
float x,y;
float angle=0.1;
float r=45;
 
float diff=1;
 
 
void setup(){
  size(600,600); 
  background(270,90,126);
 pdf = (PGraphicsPDF) createGraphics(width, height, PDF, "MinyoungKim.pdf");
}
 
void draw(){
   
  fill(30,200,280,20);
 
   
  x= r*cos(angle);
  y= r*sin(angle);
   
  fill(50,100,77,10);
  noStroke();
  translate(300,300);
  rotate(r);
  
  strokeWeight(15);
  stroke(125,200,210,20);
  line(200,10,100,30);
  ellipse(0,0,x,y);
  ellipse(x/2,y/2,170,170);
  
  fill(20,10,175,10);
  noStroke();
  ellipse(0,0,x,y);
  translate(width/1,height/2);
  rotate(r);
  
   
   
  angle= angle +0.1;
  r= r- diff;
   
  if(r==0||r==370){
    diff=diff*-1;
  } 
}
void keyPressed() {
  if (key == 'r') {
    if (recording) {
      endRecord();
      println("Recording stopped.");
      recording = false;
    } else {
      beginRecord(pdf);
      println("Recording started.");
      recording = true;
    }
  } else if (key == 'q') {
    if (recording) {
      endRecord();
    }
    exit();
  }  
}

