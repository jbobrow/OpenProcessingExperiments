
import processing.pdf.*;

import processing.pdf.*;

import processing.pdf.*;
 
 
float x,y;
float angle=0;
float r=400;
 
float diff=1;
 
 
void setup(){
  size(600,600); 
  //size(600,600,PDF,"joounghyuncho.pdf"); 
  background(255,255,255);
 
}
 
void draw(){
   
  noFill();
 
   
  x= r*cos(angle);
  y= r*sin(angle);
   
  noFill();
  stroke(2555,2555);
  translate(300,300);
  rotate(r);
   
  stroke(25,40,38,10);
  //line(255,255,x,y);
  ellipse(0,0,x,y);
  ellipse(x,x,x,x);
  ellipse(x/25,y/40,300,300);
  ellipse(x,y,300,300);
  ellipse(x/10,y/10,300,300);
  //ellipse(x/10,y/40,300,300);    
   
  angle= angle +0.1;
  r= r- diff;
   
  if(r==110||r==50){
    diff=diff*-100;
  } 
     
    println(x);  
     //if (frameCount == 500) {
    //exit();
  //}
}
