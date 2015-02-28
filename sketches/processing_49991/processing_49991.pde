
float cX, cY, rX, rY, rColor, rMod;

void setup() {
  size(640, 360);
  smooth();
  cursor(CROSS);
  
  //declare coordinates of circle and rectangle
  cX = width * 0.66;
  cY = height * 0.5;
  rX = width * 0.33 - 50;
  rY = height * 0.5 - 50;
  
  //declare colors for rectangle
  rColor = 5;
  rMod = 5;
}

void draw() {
   background(102);   
   noFill();
   
   //if offscreen then reset
   if (mouseX < 0 || mouseY < 0 || mouseX > 640 || mouseY > 360) {
      //declare coordinates of circle and rectangle
      cX = width * 0.66;
      cY = height * 0.5;
      rX = width * 0.33 - 50;
      rY = height * 0.5 - 50;
  
      //declare colors for rectangle
      rColor = 5;
      rMod = 5;
   }   
   rect(rX, rY, 100, 150); 
   
   if (mouseX >= rX && mouseX <= rX+100) {
     if (mouseY >= rY && mouseY <= rY+150) {
       //if within the rectangle then color it black
       fill(rColor); 
       rect(rX, rY, 100, 150);
       
       //check if mouse is pressed
       if (mousePressed) {
         //change the color of the rectangle
         if (rColor == 255 || rColor == 0) {
           rMod = rMod*(-1.0);
         }
         rColor = rColor + rMod;
       }
     }
   }
   
   noFill();
   ellipse(cX, cY, 100, 100); 
   if (dist(cX, cY, mouseX, mouseY) <= 50) {
     fill(100, 100, 200); 
     ellipse(cX, cY, 100, 100);
     if (mousePressed) {
       cX = mouseX;
       cY = mouseY;
     }
   }   
}


