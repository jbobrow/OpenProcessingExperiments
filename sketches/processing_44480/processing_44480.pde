
//Timmis Flower_Pattern_01112011 
  
  
void setup() {   
  size(500, 500); 
  smooth(); 
  stroke(234, 167, 21); 
  strokeWeight(3); 
  noFill(); 
} 
   
void draw() { 
   
  background(21, 234, 179); 
   
    int diameter = 25;  //update für Kreisdurchmesser 
   
      for (int cols = 0; cols < 8; cols++) { 
      for (int rows = 0; rows < 8; rows++) { 
      drawTile(70 * cols, 70 * rows, diameter); 
    } 
  } 
} 
   
void drawTile(int xPos, int yPos, int d) { 
  noFill(); 
  ellipse(xPos + 27, yPos + 27, d, d);  
  noFill(); 
  ellipse(xPos + 47, yPos + 27, d, d); 
  noFill(); 
  ellipse(xPos + 27, yPos + 47, d, d); 
  noFill(); 
  ellipse(xPos + 47, yPos + 47, d, d); 
  
  // roter Kreis 
  fill (165, 38, 38);  
  ellipse(xPos + 37, yPos + 37, 30, 30); 
}
