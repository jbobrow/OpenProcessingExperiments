
size(600, 480);
smooth();
strokeWeight(2);
background(255,204,102);
ellipseMode(RADIUS);

// Antennae
line(276, 140, 246, 90); // Left antennae
line(276, 140, 306, 100); // Right antennae


// Body
noStroke();
fill(102); // Set fill to grey
arc(275, 245, 45, 45, 0, 3.14);  // lower body
fill(0); // Set fill to black
rect(230, 170, 90, 70); // upper body


// Head
fill(255);
arc(276, 155, 45, 45, 3.14, 6.28);  // Head
fill(153); // Set fill to light gray
ellipse(263, 138, 4, 4); // Small eye 1
ellipse(296, 138, 4, 4); // Small eye 2


// Arms
fill(255); // White arms
triangle(220, 170, 235, 170, 275, 220);  // Left arm
triangle(330, 170, 345, 170, 300, 220);  // Right arm








