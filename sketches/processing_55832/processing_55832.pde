
//space of 3 points; 3 planet points, 3 stars, cube orbits

import processing.opengl.*;
float x,y,z,angle;

void setup(){
  size(600,600,OPENGL);
  background(0);
  x=0;
  y=0;
  angle=0;
  smooth();
}

void draw(){
  background(0);
  planetPoints();
  
}

void planetPoints(){
  
  lights(); 
  x= cos(radians(angle)) * 150 + width/2; 
   y= sin(radians(angle)) * 150 + height/2; 
    z= cos(radians(angle)) +width/2;
    
    pushMatrix();
    translate(x,300,y/2); 
    rotateY(x); 
    rotateX(angle);
    fill(255,7,20); //red planet#1 (each planet has 2 cube orbits)
    sphere(8); 
   
  
    translate(50,100,50);
    fill(246,32,160);
    box(8); //orbit#1 pink
    
    translate(x,100,y); 
   
    fill(255,128,0);
    box(18); //orbit#2 orange
    
  popMatrix();
  
  pushMatrix();
  translate(y,300,x);
  rotateY(angle);
  rotateX(z);
  fill(60,240,50); //green planet#2
  sphere(5);
  
  
    translate(50,100,50); 
    
    fill(255,255,0);
    box(8); //orbit#1 yellow
    
    translate(50,100,50); 
    
    fill(184,134,11);
    box(15); //orbit#2 golden brown
    
 
  popMatrix();
  
   pushMatrix();
   
  translate(z,300,x/2);
  rotateY(z);
  rotateX(y);
  fill(10,10,230); //blue planet#3 
  sphere(15);
  
   translate(30,80,30); 
    rotateY(angle); 
    rotateX(x);
    fill(148,73,232);
    box(10); //orbit#1 purple
    
    translate(30,80,30); 
    rotateY(x); 
    rotateX(z);
    fill(202,200,193);
    box(7); //orbit#2 gray
  
   
    
 
  popMatrix();
  
  

  x = cos(radians(angle))*200+ width/2 ; //angle
  y = sin(radians(angle)) *200 + height/2; //sound wave
  fill(100);
  noStroke();
  lights();
  ellipse(angle,x,5,5);
  ellipse(angle,y,5,5);
 ellipse(angle,z,5,5);
 ellipse(x,y,5,5);
 ellipse(x,z,5,5);
 ellipse(x,angle,5,5);
 ellipse(y,angle,5,5);
 ellipse(z,angle,5,5);
 ellipse(y,z,5,5);
 //9 white mini stars make wave and eventually 3 stars are left 
 

  
  angle++;
}




