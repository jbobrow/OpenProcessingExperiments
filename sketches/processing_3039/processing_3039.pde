
import processing.pdf.*;  
  
PImage ciudadabierta;  
  
int n;  
float r,g,b,bright;  
  
void setup() {  
  size(600,453);  
    
ciudadabierta=loadImage("ciudadabierta.jpg");  
    
  noLoop();  
  smooth();  
 
  background(0);  
}  
  
void draw() {  
    
  noStroke();  
  for(int i=0; i<60; i++) {  
    for(int j=0; j<60; j++) {  
      n=ciudadabierta.get(i*10,j*10);  
      r=red(n);  
      g=green(n);  
      b=blue(n);  
      
      bright=(brightness(n)/255)*10;  
        
      fill(r,g,b);  
       
          
       ellipse(i*10+20,j*10+10, bright+10,bright+10);
      ellipse(i*10+15,j*10+15, bright+15,bright+15);
      
      
    }  
  }  
  
  
}  


