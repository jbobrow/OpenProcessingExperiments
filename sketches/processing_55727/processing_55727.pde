
size(720, 480);
smooth();
strokeWeight(2);
background(204);
ellipseMode(RADIUS);

// Neck
stroke(102);               // Set stroke to gray
line(266, 200, 266, 162);  // Left
line(276, 200, 276, 162);  // Middle
line(286, 200, 286, 162);  // Right

// Antennae
line(276, 155, 246, 112);   //Small
line(276, 155, 306, 100);   //Tall

// Body 
noStroke();                 // Disable stroke 
fill(0);                    // Set fill to black 
arc(275, 280, 80, 80, PI, TWO_PI);    // Main body TOP
fill(102);                  // Set fill to gray 
rect(195, 274, 160, 6);      // Gray stripe 

// Legs
noStroke();                 // Disable stroke 
fill(102);                  // Set fill to gray 
ellipse(265, 310, 4, 4);    // Right Antigravity orb 
ellipse(285, 310, 4, 4);    // Left Antigravity orb 
fill(0);                    // Set fill to black 
rect(260, 280, 10, 30);     // Leftleg
rect(280, 280, 10, 30);     // Rightleg

// Head 
fill(0);                    // Set fill to black 
ellipse(276, 155, 60, 35);  // Head 
fill(255);                  // Set fill to white 
ellipse(288, 150, 14, 14);  // Large eye 
ellipse(263, 148, 12, 12);  // Small eye
fill(0);                    // Set fill to black 
ellipse(288, 150, 3, 3);    // Pupil large eye 
ellipse(264, 150, 3, 3);    // Pupil small eye 

// Arms
noStroke();                 // Disable stroke
fill(0);                    // Set fill to black 
rect(200, 210, 40, 5);     // Left arm
rect(310, 210, 40, 5);     // Right arm
fill(255);                  // Set fill to white
rect(340, 210, 5, 5);     // Right arm dec
rect(205, 210, 5, 5);     // Left arm dec



