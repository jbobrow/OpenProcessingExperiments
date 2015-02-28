

size(720, 480);
smooth();
strokeWeight(2);
background(204);
ellipseMode(RADIUS);
// Neck
stroke(102); // Set stroke to gray
line(266, 215, 266, 162); // Left
line(286, 215, 286, 162); // Right
// Antennae
line(276, 155, 246, 70); // Small
line(276, 155, 306, 70); // Tall
line(276, 155, 342, 70); // Medium
line(276, 155, 200, 70);
line(276, 155, 275, 70);
// Body
noStroke(); // Disable stroke
fill(102); // Set fill to gray
ellipse(311, 374, 19, 19); // Antigravity orb
ellipse(276, 374, 19, 19); // Antigravity orb
ellipse(240, 374, 19, 19); // Antigravity orb
fill(0); // Set fill to black
rect(219, 216, 112, 140); // Main body
fill(102); // Set fill to gray
arc(331, 227, 35, 35, 0, HALF_PI);

// Head
fill(0); // Set fill to black
rect(242, 120, 65, 75); // Head
fill(255); // Set fill to white
ellipse(275, 140, 10, 10); // Large eye
fill(0); // Set fill to black
fill(255); // Set fill to white
ellipse(275, 165, 10, 10); 
fill(153); // Set fill to light gray




