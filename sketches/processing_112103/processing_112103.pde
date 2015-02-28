
//import processing.pdf.*;

float x,angle;
float y = 0;
float r =400;
float a =1;

void setup(){
  size(600,600);
background(237,240,235);
//beginRecord(PDF, "please.pdf");
}

void draw(){
  translate(width/2,height/2);
  
  x = r*sin(angle);
  y = r*cos(angle);
  r=r-a;
  strokeWeight(1.1);
  stroke(random(70, 255));
  
   
ellipse(0,0,x,y);
fill(48,48,49);
ellipse(x/2,y/2,20,20);
 
fill(255);
 
 
ellipse(x, y, 10, 10);
ellipse(x + 10, y + 10, 15, 15);
ellipse(x - 15, y - 15, 15, 15);
ellipse(x*2, y*2, 10, 10);
 
 
angle = angle + 0.1;
//println(x);
if(r == 0||r==400){
  a = a*-1;
}
}
