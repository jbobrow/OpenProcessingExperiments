
   //int block = rect (mouseX, mouseY, 4, 4,)
     int value = 0;
     
     void setup() {
       size(400, 400);
            
       color redcentre = color  (240, 81, 31);
       fill (redcentre);
       ellipse (200, 200, 300, 300);
       color path = color (255, 255, 255);
       fill (path);
       rect (100, 250, 100, 200);
       color patha = color (0, 0, 0);
       fill (patha);
       rect (200, 250, 100, 200);
       color path2 = color (100, 100, 100);
       fill (path2);
       rect (0, 40, 399, 30);
     }
		  
     void draw() {
       //rect (mouseX, mouseY, mouseX, mouseY);
         if(mousePressed) { 
     stroke(mouseY,mouseX,mouseY-mouseX); 
   } else { 
     stroke(mouseX,mouseY,0); 
     } 
     line(mouseY, mouseX, mouseX, mouseY);
     
     fill(value);
  rect(25, 25, 50, 50);
  rect(125, 25, 50, 50);
  rect(225, 25, 50, 50);
  rect(325, 25, 50, 50);
}

void keyReleased() {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
     

     }
     

