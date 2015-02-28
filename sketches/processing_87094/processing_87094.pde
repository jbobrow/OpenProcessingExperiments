
size(720, 480);
smooth();
strokeWeight(2);
background(255, 201, 228);     // Light blue color
ellipseMode(RADIUS);
// Neck
stroke(102);                // Set stroke to pink
line(266, 257, 266, 162);   // Left
line(276, 257, 276, 162);   // Middle
line(286, 257, 286, 162);   // Right
// Antennae
line(276, 155, 246, 112);   // Small
line(276, 155, 306, 56);    // Tall
line(276, 155, 342, 170);   // Medium
// Body
noStroke();                 // Disable stroke
fill(102);                  // Set fill to red
ellipse(264, 377, 33, 33);  // Antigravity orb 
fill(0, 255, 0, 160);          // Green color
rect(219, 257, 90, 120);    // Main body
fill(902);                  // Set fill to purple
rect(219, 274, 90, 6);      // Gray stripe
// Head
fill(0);                    // Set fill to black
ellipse(276, 155, 155, 45);  // Head
fill(255);                  // Set fill to white
ellipse(288, 150, 54, 34);  // Large eye
fill(0);                    // Set fill to black
ellipse(288, 150, 13, 13);    // Pupil
fill(0, 255, 0, 160);       // Green color
ellipse(263, 148, 5, 0);    // Small eye 1

ellipse(305, 192, 3, 3);    // Small eye 3
