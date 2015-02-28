
size(550, 480); 
smooth(); 
strokeWeight(3); 
background(205); 
ellipseMode(RADIUS);

// Neck 
stroke(102); // Set stroke to gray
line(266, 257, 266, 200); // Left

line(286, 257, 286, 200); // Right

// Body 
noStroke(); // Disable stroke
fill(102); // Set fill to grey
fill(0); // Set fill to black
rect(224, 257, 100, 120); // Main body
fill(102); // Set fill to grey
rect(224, 274, 100, 6); // Grey stripe
rect(224, 284, 100, 6); // Grey stripe
rect(224, 294, 100, 6); // Grey stripe
rect(224, 304, 100, 6); // Grey stripe
rect(224, 314, 100, 6); // Grey stripe
rect(253, 324, 10, 10); // Grey stripe
rect(269, 324, 10, 10); // Grey stripe
rect(286, 324, 10, 10); // Grey stripe
rect(303, 324, 10, 10); // Grey stripe
rect(235, 324, 10, 10); // Grey stripe

// Head 
fill(0); // Set fill to black
ellipse(276, 155, 45, 45); // Head
fill(255); // Set fill to white
ellipse(288, 150, 14, 14); // Large eye
fill(255); // Set fill to white
ellipse(265, 150, 14, 14); // Large eye
fill(0); // Set fill to black
ellipse(265, 150, 3, 3); // Pupil
fill(0); // Set fill to black
ellipse(288, 150, 3, 3); // Pupil
fill(153); // Set fill to light grey



