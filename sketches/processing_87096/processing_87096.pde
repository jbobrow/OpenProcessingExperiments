
size(720, 480);
smooth();
strokeWeight(2);
background(204);
ellipseMode(RADIUS);

// Antennae
line(276, 155, 246, 112);   // Small
line(276, 155, 306, 56);    // Tall
line(276, 155, 342, 170);   // Medium
// Body
noStroke();                 // Disable stroke
fill(170,234,9);                  // Set fill to gray
ellipse(300, 317, 313, 313);  // Antigravity orb 
fill(255,8,12);                    // Set fill to black
rect(219, 197, 90, 120);    // Main body
fill(255,162,255);                  // Set fill to gray
rect(219, 274, 90, 6);      // Gray stripe
rect(219, 287, 90, 6);      // Gray stripe
rect(219,300,90, 6);      // Gray stripe
// Head
fill(255,243,201);                    // Set fill to black
ellipse(276, 155, 45, 45);  // Head
fill(255);                  // Set fill to white
ellipse(288, 150, 14, 14);  // Large eye
fill(201,251,255);                    // blue
ellipse(288, 150, 3, 3);    // Pupil
fill(255);                  // Set fill to white
ellipse(258, 150, 14, 14);  // Large eye
fill(255);                  // Set fill to white
ellipse(264, 180, 14, 14);  // Large eye

fill(201,251,255);                  // blue
ellipse(263, 148, 5, 5);    // Small eye 1
