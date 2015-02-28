
import processing.pdf.*; 
 
PImage arboles; 
 
int mm; 
float r,g,b,bright; 
 
void setup() { 
  size(604,453); 
   
arboles=loadImage("arboles.JPG"); 
   
  noLoop(); 
  smooth(); 

  background(0); 
} 
 
void draw() { 
   
  noStroke(); 
  for(int i=0; i<60; i++) { 
    for(int j=0; j<60; j++) { 
      mm=arboles.get(i*10,j*10); 
      r=red(mm); 
      g=green(mm); 
      b=blue(mm); 
      bright=(brightness(mm)/255)*10; 
       
      fill(r,g,b); 
      
       ellipse(i*10+5,j*10+5, bright,bright); 
        
       ellipse(i*10+10,j*10+10, bright+8,bright+8); 
        ellipse(i*10+20,j*10+20, bright+10,bright+10); 
    } 
  } 
 
 
} 


