
import processing.pdf.*;
 
void setup() {
 
  //this function used in combination with exit() below to produces a pdf file 
  size(1024, 768, PDF, "wallpaper.pdf");
  smooth();
}
 
 
 //looping rectangle
void draw() {
 for (int x = 0; x <= width; x += 20) {
      for (int y = 0; y <= height; y+=40) {
        fill(0, 0, 0);
        rect(x, y, 10, 10);
      }
    }  

//    
int rows = 26;
int cols = 38;
int circleDiameter = 40;
int distanceX = 30;
int distanceY = 30;
 
for (int r = 0; r <= rows; r++) {
  for (int c = 0; c <= cols; c++) {
    stroke(c*10, r*5, r*c);
    strokeWeight(5);
    fill(r*4, c*5, r*c*(1/2), 100);
    ellipse(c*distanceX, r*distanceY, circleDiameter, circleDiameter);
  }
  noLoop();
}
 
  // Exit the program 
  println("Finished.");
 
  /*
  exit() here makes the sketch similar to static mode 
   the draw function is called only once
   don't do anythinginteractive or dynamically animated
   your output should be produced instantaneously  
   */
 
  exit(); 
}
                                
