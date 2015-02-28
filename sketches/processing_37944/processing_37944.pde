
int rows = 70;
int cols = 70;
int rectLength = 80;
int distanceX = 40;
int distanceY = 40;

//import processing.pdf.*;


size(2200,1700);
  //size(2200, 1700, PDF, "wallpaper.pdf");
smooth();
noFill();
background(230,230,255);
 

noStroke();

  for (int r = 0; r <= rows; r++) {
  for (int c = 0; c <= cols; c++) {
 
    pushMatrix();
    translate(c*distanceX-1600, r*distanceY-1600); 
  
    rotate(radians(45));
  
    fill(random(50,256),random(50,256),255,150);
    rect(c*distanceX, r*distanceY, rectLength, rectLength);
    popMatrix();
    
    fill(random(50,256),random(50,256),255,150);
    rect(c*distanceX, r*distanceY, 30, 30);
   
  }
  }

//exit();


