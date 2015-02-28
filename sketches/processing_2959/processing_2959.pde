
import processing.pdf.*; 
 
PImage ritoque; 
 
int col; 
float r,g,b,bright; 
 
void setup() { 
  size(604,453); 
   
 ritoque=loadImage("ritoque.jpg"); 
   
  noLoop(); 
  smooth(); 

  background(0); 
} 
 
void draw() { 
   
  stroke(255); 
  for(int i=0; i<60; i++) { 
    for(int j=0; j<60; j++) { 
      col=ritoque.get(i*10,j*10); 
      r=red(col); 
      g=green(col); 
      b=blue(col); 
      bright=(brightness(col)/255)*8; 
       
      fill(r,g,b); 
      strokeWeight(bright/2); 
      line(i*10,j*10+10, i*10+10,j*10); 
      
      
    } 
  } 
  saveFrame(); 
 
 
}

