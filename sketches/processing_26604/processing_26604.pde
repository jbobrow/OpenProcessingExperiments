
import processing.opengl.*;
 

   float angle = 0;            
   float distance = dist(pmouseX, pmouseY, mouseX, mouseY);
   color strokecolor;  
   int x = 0;
   int y = 0;
  
  void setup () {
    size(700,700, OPENGL);
   hint(ENABLE_OPENGL_4X_SMOOTH);
    smooth(); 
  }
   
  void draw () {
   
      background(0);
      strokecolor = color(0,255,255,30);
      for ( x = 0; x <= width; x+=50) {
        for (y = 0; y <= height; y+=50) {
              
              angle = atan2(mouseY-y, mouseX-x); 
              pushMatrix();
              
              translate(mouseX,mouseY);
              rotate(angle);
              
              stroke(strokecolor);
             
              for (int i = 0; i < 900; i +=50) {
                
                line(i - 200, -200, i - 200, 200);
                line(i + 10, +10, i +10, 10);
                line(pmouseX,pmouseY,i,i);
                line(10,0,10,30);
                line(100, 0,10, 50);

              }  
                 strokeWeight(0.2);
                 popMatrix();
        }
      }
  }

