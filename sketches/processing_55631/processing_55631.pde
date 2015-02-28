

size(720, 480);
smooth();
strokeWeight(15);
background(204);
ellipseMode(RADIUS);

// Neck
stroke(102);                // Set stroke to gray
line(266, 257, 266, 162);   // Left
line(230, 257, 200, 162);   // Middle
line(286, 257, 286, 162);   // Right

// Antennae
line(276, 155, 190, 112);   // Small
line(276, 155, 280, 56);    // Tall
line(276, 155, 342, 170);   // Medium

// Body
noStroke();                 // Disable stroke
fill(0, 255, 0);                  // Set fill to gray
ellipse(264, 377, 33, 33);  // Antigravity orb 
fill(0);                    // Set fill to black
rect(219, 257, 90, 120);    // Main body
fill(102);                  // Set fill to gray
rect(219, 274, 90, 6);      // Gray stripe

// Head
fill(0, 0, 255);                    // Set fill to black
ellipse(276, 155, 45, 45);  // Head
fill(255);                  // Set fill to white
ellipse(255, 150, 14, 14);  // Large eye
ellipse(292, 150, 20, 20);  // Large eye
fill(108);                    // Set fill to black
ellipse(288, 150, 3, 3);    // Pupil
fill(153);                  // Set fill to light gray
ellipse(263, 148, 5, 5);    // Small eye 1
ellipse(296, 130, 4, 4);    // Small eye 2
ellipse(305, 162, 3, 3);    // Small eye 3


// Head
fill(0);                    // Set fill to black
rect(180, 140, 45, 45);  // Head
fill(255);                  // Set fill to white
ellipse(255, 150, 14, 14);  // Large eye
ellipse(292, 150, 20, 20);  // Large eye
ellipse(199, 160, 17, 9);  // Large eye
fill(255, 0, 0);                    // Set fill to black
ellipse(288, 150, 3, 3);    // Pupil
line(200, 210, 80, 80);   // Left                                            
line(150, 250, 150, 150);   // Left
rect(197, 160, 5, 5);    // Pupil
fill(153);                  // Set fill to light gray
ellipse(263, 148, 5, 5);    // Small eye 1
ellipse(296, 130, 4, 4);    // Small eye 2
ellipse(305, 162, 3, 3);    // Small eye 3


