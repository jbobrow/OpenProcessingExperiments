
//Robot Duplication
 
void setup() {
  size(800, 400);
  smooth();
  strokeWeight(2);
  background(204);
  ellipseMode(RADIUS);
}
 
 
void draw() {
  
  drawRobot(150, 200, 50, 70);
  drawRobot(280, 260, 20, 100);
  drawRobot(420, 310, 80, 50);
  drawRobot(600, 200, 40, 90);
}

 void drawRobot(int x, int y, int grilllength, int neckHeight) {
   
  int radius = 45;
  int ny = y - neckHeight - grilllength - radius;

 
// Head
noStroke();                                    // Disable stroke
fill(100);                                       // Set fill to black
ellipse(x, y - 15 - neckHeight, 45, 45);       // Head
fill(0);                              // Set fill to black
ellipse(x + 12, y - 20 - neckHeight, 12, 13);  // eye
ellipse(x - 11, y - 20 - neckHeight, 12, 13);  // eye
fill(0);                                       // Set fill to black
 
 
// Body
noStroke();                           // Disable stroke
fill(100);                              // Set fill to grey
rect(x - 45, y - 20 , 90, 140);   // Main body TOP
fill(100);                    // Set fill to grey
 
// Grill
noStroke();                                         // Disable stroke
fill(0);                                            // Set fill to black
rect(x - 35, y + 56, 10, grilllength);                // Leftleg
rect(x - 15, y + 56, 10, grilllength);                 // Rightleg
rect(x + 5, y + 56, 10, grilllength);
rect(x + 25, y + 56, 10, grilllength);
 
// Arms 
noStroke();                       // Disable stroke
fill(0);                          // Set fill to black
rect(x - 60, y - 20, 15, 50);      // Left arm
rect(x + 45, y - 20, 15, 50);      // Right arm
fill(100);                 // Set fill to grey


 
}


