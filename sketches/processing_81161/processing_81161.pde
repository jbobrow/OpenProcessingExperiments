
// Robot 2: Variables from "Getting Started with Processing"
// by Reas & Fry. O'Reilly / Make 2010
// re-coded by Programming AtTemp 2012
 
int x = 500;                                    // X-coordinate
int y = 500;                                    // Y-coordinate
int bodyHeight = 110;                           // Body Height
int neckHeight = 140;                           // Neck Height
int radius = 45;
int ny = y - bodyHeight - neckHeight - radius;  // Neck Y
 
size(600, 600);
smooth();
strokeWeight(3);
background(#009900);                            //Green
ellipseMode(RADIUS);
 
// Neck
stroke(#ffcc00);                                // Set stroke to Templeton Gold
line(x+2, y-bodyHeight, x+2, ny);               // Left
line(x+12, y-bodyHeight, x+12, ny);             // Middle
line(x+22, y-bodyHeight, x+22, ny);             // Right
 
// Neck from Robot1
// line(266, 257, 266, 162);   // Left
// line(276, 257, 276, 162);   // Middle
// line(286, 257, 286, 162);   // Right
 
// Antennae
line(x+12, ny, x-18, ny-43);                    // Small
line(x+12, ny, x+42, ny-99);                    // Tall
line(x+12, ny, x+78, ny+15);                    // Medium
 
// Antennae from Robot1
// line(276, 155, 246, 112);   // Small
// line(276, 155, 306, 56);    // Tall
// line(276, 155, 342, 170);   // Medium
 
// Body
noStroke();                                     // Disable stroke
fill(80);                                      // Set fill to gray
ellipse(x, y+10, 33, 33);                       // Antigravity orb
fill(0);                                        // Set fill to black
rect(x-45, y-bodyHeight, 90, bodyHeight+10);    // Main body
fill(102);                                      // Set fill to gray
rect(x-45, y-bodyHeight+17, 90, 6);             // Gray stripe
 
// Body from Robot1
// ellipse(264, 377, 33, 33);  // Antigravity orb
// rect(219, 257, 90, 120);    // Main body
// rect(219, 274, 90, 6);      // Gray stripe
 
// Head
fill(90);                                        // Set fill to grey
ellipse(x+12, ny, radius, radius);              // Head
fill(200);                                      // Set fill to white
ellipse(x+24, ny-6, 14, 14);                    // Large eye
fill(0);                                        // Set fill to black
ellipse(x+24, ny-6, 3, 3);                      // Pupil
fill(243);                                      // Set fill to white
ellipse(x, ny-8, 5, 5);                         // Small eye 1
ellipse(x+30, ny-26, 4, 4);                     // Small eye 2
ellipse(x+41, ny+6, 3, 3);                      // Small eye 3
 
// Head from Robot1
// ellipse(276, 155, 45, 45);  // Head
// ellipse(288, 150, 14, 14);  // Large eye
// ellipse(288, 150, 3, 3);    // Pupil
// ellipse(263, 148, 5, 5);    // Small eye 1
// ellipse(296, 130, 4, 4);    // Small eye 2
// ellipse(305, 162, 3, 3);    // Small eye 3
