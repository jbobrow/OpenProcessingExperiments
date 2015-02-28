
float x = 300;          // X-coordinate
float y = 450;         // Y-coordinate
int radius = 45;       // Head Radius
int bodyHeight = 160;  // Body Height
int neckHeight = 70;   // Neck Height
 
// int x = 264;                                    // X-coordinate
// int y = 420;                                    // Y-coordinate
// int radius = 45;
// int bodyHeight = 110;                           // Body Height
// int neckHeight = 140;                           // Neck Height
 
float easing = 0.02;
 
void setup() {
  size(400, 600);
  smooth();
  strokeWeight(6);
  ellipseMode(RADIUS);
 
// size(600, 600);
// smooth();
// strokeWeight(3);
// ellipseMode(RADIUS);
}
 
void draw() {
   
  int targetX = mouseX;
  x += (targetX - x) * easing;
     
  if (mousePressed) {
    neckHeight = 100;
    bodyHeight = 200;
  } else {
    neckHeight = 50;
    bodyHeight = 100;
  }
   
  float ny = y - bodyHeight - neckHeight - radius;
// int ny = y - bodyHeight - neckHeight - radius;  // Neck Y 
  background(#123654);
   
  // Neck
  stroke(#ffcc00);                 // Set stroke to Templeton Gold
  line(x+2, y-bodyHeight, x+2, ny);
  line(x+12, y-bodyHeight, x+12, ny);
  line(x+22, y-bodyHeight, x+22, ny);
 
// Neck from Robot2
// stroke(#ffcc00);                                // Set stroke to Templeton Gold
// line(x+2, y-bodyHeight, x+2, ny);               // Left
// line(x+12, y-bodyHeight, x+12, ny);             // Middle
// line(x+22, y-bodyHeight, x+22, ny);             // Right
  
// Neck from Robot1
// line(266, 257, 266, 162);   // Left
// line(276, 257, 276, 162);   // Middle
// line(286, 257, 286, 162);   // Right
 
  // Antennae
  line(x+12, ny, x-18, ny-43);
  line(x+12, ny, x+42, ny-99);
  line(x+12, ny, x+78, ny+15);
  line(x+12, ny, x+120, ny);
 
 
// Antennae from Robot2
// line(x+12, ny, x-18, ny-43);                    // Small
// line(x+12, ny, x+42, ny-99);                    // Tall
// line(x+12, ny, x+78, ny+15);                    // Medium
  
// Antennae from Robot1
// line(276, 155, 246, 112);   // Small
// line(276, 155, 306, 56);    // Tall
// line(276, 155, 342, 170);   // Medium
  
  // Body
  noStroke();
  fill(150);
  ellipse(x, y-33, 33, 33);
  fill(0);
  rect(x-45, y-bodyHeight, 90, bodyHeight-33);
  fill(150);
  rect(x-45, y-bodyHeight+17, 90, 6);
   
// Body
// noStroke();                                     // Disable stroke
// fill(102);                                      // Set fill to gray
// ellipse(x, y+10, 33, 33);                       // Antigravity orb
// fill(0);                                        // Set fill to black
// rect(x-45, y-bodyHeight, 90, bodyHeight+10);    // Main body
// fill(102);                                      // Set fill to gray
// rect(x-45, y-bodyHeight+17, 90, 6);             // Gray stripe
  
// Body from Robot1
// ellipse(264, 377, 33, 33);  // Antigravity orb
// rect(219, 257, 90, 120);    // Main body
// rect(219, 274, 90, 6);      // Gray stripe
  
 
  // Head
  fill(0);
  ellipse(x+12, ny, radius, radius);
  fill(255);
  ellipse(x+24, ny-6, 14, 14);
  fill(0);
  ellipse(x+24, ny-6, 3, 3); 
  fill(153);                                      // Set fill to light gray
  ellipse(x, ny-8, 5, 5);                         // Small eye 1
  ellipse(x+30, ny-26, 4, 4);                     // Small eye 2
  ellipse(x+41, ny+6, 3, 3);                      // Small eye 3
  
  
// Head
// fill(0);                                        // Set fill to black
// ellipse(x+12, ny, radius, radius);              // Head
// fill(255);                                      // Set fill to white
// ellipse(x+24, ny-6, 14, 14);                    // Large eye
// fill(0);                                        // Set fill to black
// ellipse(x+24, ny-6, 3, 3);                      // Pupil
// fill(153);                                      // Set fill to light gray
// ellipse(x, ny-8, 5, 5);                         // Small eye 1
// ellipse(x+30, ny-26, 4, 4);                     // Small eye 2
// ellipse(x+41, ny+6, 3, 3);                      // Small eye 3
  
// Head from Robot1
// ellipse(276, 155, 45, 45);  // Head
// ellipse(288, 150, 14, 14);  // Large eye
// ellipse(288, 150, 3, 3);    // Pupil
// ellipse(263, 148, 5, 5);    // Small eye 1
// ellipse(296, 130, 4, 4);    // Small eye 2
// ellipse(305, 162, 3, 3);    // Small eye 3
 
}
