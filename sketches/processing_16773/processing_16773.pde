

 void setup() {
       size(500, 500);
       stroke(0);
       background(250);
     } 
     void draw() {
       line(200, 75, 420, 230);
       line(200, 75, 75, 200);
       line(350, 400, 420, 230);
       line(350, 400, 75, 350);
       line(75, 200, 75, 350);
       
       line(200, 75, mouseX, mouseY);
       line(75, 200, mouseX, mouseY);
       line(420, 230, mouseX, mouseY);
       line(350, 400, mouseX, mouseY);
       line(75, 350, mouseX, mouseY);
       
       // saveFrame("output###.png");
     }
     void mousePressed() {
       background(250);
     }

                
                                                                
