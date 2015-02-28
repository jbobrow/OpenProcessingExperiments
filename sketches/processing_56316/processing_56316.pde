
int x = 60; // x coordinate
int y = 390; // y coordinate
int bodyHeight = 180; // body height
int neckHeight = 40; // neck height
int radius = 45; // head radius
int ny = y - bodyHeight - neckHeight - radius; //neck y

size(720, 480); 
smooth(); 
strokeWeight(2); 
background(255, 204, 0); //set background yellow
ellipseMode(RADIUS);

// Neck 
stroke(102); // Set stroke to gray
line(x+2, y-bodyHeight, x+2, ny); // Left
line(x+12, y-bodyHeight, x+12, ny); // Middle
line(x+22, y-bodyHeight, x+22, ny); // Right

// Antennae 
line(x+12, ny, x-18, ny-43); // Small
line(x+12, ny, x+42, ny-99); // Tall
line(x+12, ny, x+78, ny+15); // Medium

// Body 
noStroke(); // Disable stroke
fill(102, 154, 301); // Set fill to blue
ellipse(x, y-33, 33, 33); // Antigravity orb
fill(0); // Set fill to black
rect(x-45, y-bodyHeight, 90, bodyHeight-33); // Main body
fill(253, 0, 298); // Set fill to pink
rect(x-45, y-bodyHeight+17, 90, 6); // Gray stripe 1
fill(102, 154, 301); // Set fill to blue
rect(x-45, y-bodyHeight+5, 90, 6); // Gray stripe 2
rect(x-45, y-bodyHeight+30, 90, 10); // Gray stripe 3

// Head 
fill(0); // Set fill to black
ellipse(x+12, ny, radius, radius); // Head
fill(255); // Set fill to white
ellipse(x+24, ny-6, 14, 14); // Large eye
fill(0); // Set fill to black
ellipse(x+24, ny-6, 3, 3); // Pupil
fill(253, 0, 298); // Set fill to pink
ellipse(x, ny-8, 5, 5); // Small eye 1
ellipse(x+30, ny-26, 4, 4); // Small eye 2
ellipse(x+41, ny+6, 3, 3); // Small eye 3
fill(102, 154, 301); // Set fill to blue
ellipse(x-20, ny-71, 38, 15); //halo

