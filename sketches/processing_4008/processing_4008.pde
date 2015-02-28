
   //int block = rect (mouseX, mouseY, 4, 4,)
     int value = 0;
     
     void setup() {
       size(400, 400);
     
     }
		  
     void draw() {
       //rect (mouseX, mouseY, mouseX, mouseY);
         if(mousePressed) { 
     stroke(mouseY,mouseX,mouseY-mouseX); 
   } else { 
     stroke(mouseX,mouseY,0); 
     } 
     rect(mouseX, mouseY, mouseX, mouseY);
     
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
     

