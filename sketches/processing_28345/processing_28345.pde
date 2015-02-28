
 import netscape.javascript.*;
 void setup() {
       size(800, 600);
       background (0);
       stroke(255);
     }
		  
     void draw() {
       line(400, 300, mouseX, mouseY);
       stroke(random (255), random (255), random (255));
     }

