



 

 
PImage escaleras; 
 
int col; 
float r,g,b,bright; 
 
void setup() { 
  escaleras=loadImage("escaleras.jpg");
  size(600,450);
  noLoop(); 
  smooth(); 
  colorMode(RGB,255);
  background(0); 
} 
 
void draw() { 
   
 
  for(int y=0; y< escaleras.height; y++) { 
    for(int x=0; x<escaleras.width; x++) { 
      color col= escaleras.get(y*10,x*10); 
      r=red(col) + random(-10, 40); 
      g=green(col)+ random(30); 
      b=blue(col)+ random(-20, 30); 
      fill(r,g,b,200);
      stroke(r,g,b,200);
      bright=(brightness(col)/255); 
       
      
     
       strokeWeight(bright*3);  
        
      line(y*10+10,x*10, y*10+20,x*10);  
      line(y*10+10,x*10+20, y*10, x*10);
    } 
  } 
 
  
} 


