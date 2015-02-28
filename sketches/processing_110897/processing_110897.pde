
import processing.pdf.*;


float x,y;
float angle=0;
float r=400;

float diff=1;

void setup(){
  size(600,600);  
  background(240,240,80);
 //pdf
 
}

void draw(){
 
  x= r*cos(angle);
  y= r*sin(angle);
 
  noFill();
  stroke(0.1,25);
  //gai yuan dian
  translate(300,300);
  rotate(r);
 
 
  ellipse(0,0,x,y);
  ellipse(x/1,y/1,600,600);
 
 
  angle= angle +0.1;
  r= r- diff;
 
  if(r==0||r==400){
    diff=diff*-1;
  }  
   
    println(x);  
}
