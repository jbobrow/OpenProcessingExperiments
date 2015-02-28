
import processing.pdf.*;  
  
PImage cultcuerpo;  
  
int mm;  
float r,g,b,bright;  
  
void setup() {  
  cultcuerpo=loadImage("cultcuerpo.jpg");
  size(800,600);  
    
  
    
  noLoop();  
  smooth();  
 
  background(30);  
}  
  
void draw() {  
    
  noStroke();  
  for(int i=0; i<80; i++) {  
    for(int j=0; j<60; j++) {  
      mm=cultcuerpo.get(i*10,j*10);  
      r=red(mm);  
      g=green(mm);  
      b=blue(mm);  
      bright=(brightness(mm)/255)*40;  
    
      
      stroke(r,g,b,10);  
      fill(r,g,b,100);  
      
      ellipse(i*10+10,j*10+10, bright,bright*2); 
      ellipse(i*10+20,j*10+10, bright+10,bright+10);
      ellipse(i*10+15,j*10+15, bright+15,bright+15);
    }  
  }  
  
  
}  
 
 


