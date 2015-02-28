
size(720, 480); 
smooth(); 
strokeWeight(8); 
background(25); 
ellipseMode(RADIUS); 

// Neck 
stroke(200);                // Set stroke to white
line(266, 257, 266, 162);   // Left 
line(286, 257, 286, 162);   // Right 

// Antennae 
line(276, 155, 246, 56);   // Small 
line(276, 155, 306, 56);    // Tall 
line(300, 300, 350, 150);
line(250, 300, 250, 500);
line(286, 300, 286, 500);
// Body 
noStroke();                 // Disable stroke 
fill(102);                  // Set fill to gray 
ellipse(264, 377, 33, 33);  // Antigravity orb 
fill(0);                    // Set fill to black 
rect(219, 257, 90, 120);    // Main body 
fill(102);                  // Set fill to gray 
rect(219, 274, 90, 6);      // Gray stripe 


// Head 
fill(255);                    // Set fill to white
ellipse(276, 155, 45, 45);  // Head 
fill(25);                  // Set fill to black
ellipse(288, 150, 14, 14);  // Large eye 
fill(0);                    // Set fill to black 
ellipse(255, 150, 14, 14);  // Large eye 
fill(255);                    // Set fill to black 
ellipse(280, 150, 3, 3);    // Pupil 
fill(255);                    // Set fill to black 
ellipse(280, 150, 3, 3);    // Pupil 
fill(255);                    // Set fill to black 
ellipse(265, 150, 3, 3);    // Pupil 
fill(153);                    // Set fill to white 


