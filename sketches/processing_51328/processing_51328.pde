
import processing.dxf.*;

// Georgina Yeboah  
// PS1
// question 5



void setup(){
  size (400, 400);
  smooth();
}

 void draw(){
   for(int y=0; y<=height ; y=y+50) {
    for(int x=0; x<=width; x=x+50)  
    {  
      // This is how I understand conditionals. These comments
      // are only for my benefit.
      
      // the % is a modulo which calculates the remainder
      // of a divison. Therefore the boundaries between the blue and 
     // black squares are set by this %. 
      
     if((y+x)%20==0) {
     // here is the module equation that sets the the boundaries
   // between the sqaures within the 400 by 400 parameter  
    fill(0);      
 } else  {  
    fill(5, 255, 240);
    }  
    rect (y, x, 100, 100);
    }
   }
 }
 
  




