
 void setup() {
       size(400, 400);
        //size(400, 400, PDF, "output.pdf");
       //stroke(255);
        //stroke(255, 128, 0);       // bright orange (red 255, green 128, blue 0)
        stroke(255, 128, 0, 128);  // bright orange with 50% transparency
       background(192, 64, 0);
     } 

     void draw() {
       line(150, 25, mouseX, mouseY);
        //line(15, 25, 70, 90);
        
           // The wrong way to specify the middle of the screen
     //ellipse(200, 200, 100, 50); 
     
       // Always the middle, no matter how the size() line changes
     ellipse(width/2, height/2, 50, 50);
     }
      void mousePressed() {
       background(192, 64, 0);
       
     }

