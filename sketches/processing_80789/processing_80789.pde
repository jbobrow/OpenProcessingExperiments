
int x = 60;
int y = 460;
int bodyHeight = 260;
int neckHeight = 95;
int radius = 45;
int ny = y - bodyHeight - neckHeight - radius;

size(170, 480);
smooth();
strokeWeight(2);
background(204);
ellipseMode(RADIUS);

// Neck
stroke(102);                          // Set stroke to gray
line(x+2, y-bodyHeight, x+2, ny);     // Left
line(x+12, y-bodyHeight, x+12, ny);   // Middle
line(x+22, y-bodyHeight, x+22, ny);   // Right

// Antennae
line(x+12, ny, x-18, ny-43);   // Small
line(x+12, ny, x+42, ny-99);    // Tall
line(x+12, ny, x+78, ny+15);   // Medium

// Body
noStroke();                 // Disable stroke
fill(102);                  // Set fill to gray
ellipse(x, y-33, 33, 33);  // Antigravity orb
fill(0);                    // Set fill to black
rect(x-45, y-bodyHeight, 90, bodyHeight-33); // Main body
fill(102);                  // Set fill to gray
rect(x-45, y-bodyHeight+17, 90, 6);      // Gray stripe

// Head
fill(0);                    // Set fill to black
ellipse(x+12, ny, radius, radius);  // Head
fill(255);                  // Set fill to white
ellipse(x+24, ny-6, 14, 14);  // Large eye
fill(0);                    // Set fill to black
ellipse(x+24, ny-6, 3, 3);    // Pupil
fill(153);                  // Set fill to light gray
ellipse(x, ny-8, 5, 5);    // Small eye 1
ellipse(x+30, ny-26, 4, 4);    // Small eye 2
ellipse(x+41, ny+6, 3, 3);    // Small eye 3


