
// Robot 1: Draw from "Getting Started with Processing"
// by Reas & Fry. O'Reilly / Make 2010
// re-coded by Programming AtTemp 2012
 
size(500, 500);
smooth();
strokeWeight(4);
background(#000099);  // Set to Blue
ellipseMode(RADIUS);
 
// Neck
stroke(#ff00ff);            // Set to pink
line(266, 257, 246, 162);   // Left
line(276, 257, 256, 162);   // Middle
line(286, 257, 296, 162);   // Right
 
// Antennae
line(276, 155, 300, 112);   // Small
line(276, 155, 500, 56);    // Tall
line(276, 155, 400, 170);   // Medium
 
// Body
noStroke();                 // Disable stroke
fill(102);                  // Set fill to gray
ellipse(264, 377, 33, 33);  // Antigravity orb
fill(0);                    // Set fill to black
rect(219, 257, 90, 120);    // Main body
fill(102);                  // Set fill to gray
rect(219, 274, 90, 6);      // Gray stripe
 
// Head
fill(160);                    // Set fill to grey
ellipse(276, 155, 45, 45);  // Head
fill(0);                    // Set fill to black
ellipse(288, 150, 14, 14);  // Large eye
fill(0);                    // Set fill to black
ellipse(288, 150, 3, 3);    // Pupil
fill(50);                  // Set fill to dark gray
ellipse(263, 148, 5, 5);    // Small eye 1
ellipse(296, 130, 4, 4);    // Small eye 2
ellipse(305, 162, 3, 3);    // Small eye 3
