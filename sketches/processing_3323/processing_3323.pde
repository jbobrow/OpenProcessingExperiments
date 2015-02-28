

 
import processing.pdf.*; 
 
PImage escaleras; 
 
int col; 
float r,g,b,bright; 
 
void setup() { 
  size(600,450); 
   
  escaleras=loadImage("escaleras.jpg"); 
   
  noLoop(); 
  smooth(); 
  colorMode(RGB, 255);

  background(0); 
} 
 
void draw() { 
   
  noStroke(); 
  for(int i=0; i<60; i++) { 
    for(int j=0; j<60; j++) { 
      col=escaleras.get(i*10,j*10); 
      r=red(col) + random(10, 20); 
      g=green(col)+ random(30,45); 
      b=blue(col)+ random(10, 30); 
      bright=(brightness(col)/255)*10; 
       
      fill(r,g,b,200); 
      ellipse (i*10+5,j*10+5, bright,bright); 
      line(random(i*10, i*10+5),random(j*10,j*10+5), bright, bright);
      ellipse(i*10, j*10, bright+10, bright+10);
      line(i*20-10,j*20-15,bright+20,bright+20);
    } 
  } 
 
  
} 


