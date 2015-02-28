
 void setup() {
       size(500, 500);
       background(#4C604C,50);
     } 

     void draw() {
       
       line(0, 0, mouseX, mouseY);
       strokeWeight (1);
       stroke(255,255,255);
       
       fill(#64D8CD,50);
       ellipse(mouseX,mouseY,mouseX/2,mouseX/2);
      
      if (mousePressed) {
  
   stroke(255,255,255);
   fill(#A584BF,60);
 ellipse (mouseX, mouseY,mouseX/2,mouseX/2);}
    }
    
    void mouseClicked () {
    background(#4C604C,50);
    }

