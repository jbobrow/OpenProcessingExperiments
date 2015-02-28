
size(260, 350);
smooth();
strokeWeight(3);
background(224);
ellipseMode(RADIUS);

//Antannae
stroke(153);
line(130, 40, 130, 55);
noStroke();
fill(250, 255, 0); // Yellow
ellipse(130, 30, 4, 4); // Small circle
noFill();
stroke(255, 252, 167); // Light yellow
strokeWeight(3);
ellipse(130, 30, 8, 8); // Big circle

// Neck
noStroke();
fill(124, 0, 0);  // Red
rect(123, 140, 15, 10);

// Head
noStroke();
quad(95, 55, 165, 55, 160, 140, 100, 140); // Head
fill(255);  // White
ellipse(115, 85, 12, 12);  // Large eye
fill(153);  // Light gray
ellipse(115, 85, 5, 5);  // Small eye left
ellipse(145, 85, 5, 5);  // Small eye right
stroke(153); // Light gray
line(110, 120, 150, 120); // Mouth

// Arm
stroke(124, 0, 0); // Red 
strokeWeight(18);
line(70, 240, 85, 155); // Left arm
line(175, 155, 190, 240); // Right arm

// Body
noStroke ();
fill(124, 0, 0);  // Red
quad(85, 250, 175, 250, 160, 145, 100, 145); // Main body
arc(130, 254, 45, 45, TWO_PI, PI+TWO_PI); // Rounded half

