
size(550, 400);
smooth();
strokeWeight(2);
background(204);
ellipseMode(RADIUS);

// Neck
stroke(102);                // Set stroke to gray
line(266, 257, 266, 162);   // Left
line(276, 257, 276, 162);   // Middle
line(286, 257, 286, 162);   // Right

// Antennae
line(276, 155, 246, 112);   // Small
line(276, 155, 306, 56);    // Tall
line(276, 155, 342, 170);   // Medium

// Body
noStroke();                 // Disable stroke
fill(245, 233, 7);                  // Set fill to gray
ellipse(264, 300, 60, 60);  // Antigravity orb 
fill(245, 233, 7);                    // Set fill to black


// Head
fill(245, 233, 7);                    // Set fill to black
ellipse(276, 155, 45, 45);  // Head
fill(255);                  // Set fill to white
ellipse(288, 150, 14, 14);  // Large eye
fill(0);                    // Set fill to black
ellipse(288, 150, 3, 3);    // Pupil
fill(153);                  // Set fill to light gray

                
                
