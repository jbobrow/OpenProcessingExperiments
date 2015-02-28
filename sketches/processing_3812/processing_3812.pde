
 int i = 1;  
 float a = 200;
 float b = 200; 
 
 void setup() {
       size(400, 400);
       colorMode(RGB,width);
       stroke(255);
       background(192, 64, 0);

     } 


 
     void draw() {
       
     if (mousePressed == true) {
         stroke(mouseY,mouseX,mouseY-mouseX);
         line(a, b, mouseX, mouseY);}
     else {stroke(mouseX,mouseY,0);
      //background(192,64,0);
       line(a, b, mouseX, mouseY);}
       
       
     }
     
     void mousePressed() {
      if (i < 11) {
      fill(width);
      noStroke();
      ellipse(mouseX,mouseY,2*i*i,2*i*i); 
      i += 1;}
      else {
       background(mouseX,mouseY,0);
       a = mouseX;
       b = mouseY;
       i = 1;
      }
      
     }

