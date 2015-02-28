
//Robot_Sketch5_Movement

float x = 200;         // x-coordinate
float y = 200;         // y-coordinate
float angle = 0.0;       // Angle for motion
float grilllength = 30;    // Body Height
float neckHeight = 0;   // Neck Height
float radius = 20;       // Head Radius
 
void setup() {
  size(800, 400);
  smooth();
  strokeWeight(2);
  ellipseMode(RADIUS);
}
 
 
void draw() {
     
  // Change position by a small random amount
  x += random(-4, 4);
  y += random(-1, 1);
  // Change height of neck
  neckHeight = 80 + sin(angle) * 30;
  angle += 0.05;
  // Adjust the height of the head
  float ny = y - grilllength - neckHeight - radius;

 
 
 
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
rect(x - 35, y + 56, 10, grilllength);               
rect(x - 15, y + 56, 10, grilllength);                 
rect(x + 5, y + 56, 10, grilllength);
rect(x + 25, y + 56, 10, grilllength);
 
// Arms 
noStroke();                       // Disable stroke
fill(0);                          // Set fill to black
rect(x - 60, y - 20, 15, 50);      // Left arm
rect(x + 45, y - 20, 15, 50);      // Right arm
fill(100);                 // Set fill to grey


 
}


