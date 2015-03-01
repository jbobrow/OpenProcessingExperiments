
int x = 60; // x-coordinate
int y = 420; // y-coordinate
int bodyHeight = 190; // Body Height
int neckHeight = 85; // Neck Height
int radius = 38; // Head Radius
int ny = y - bodyHeight - neckHeight - radius; // Neck Y
size(170, 480);
smooth();
strokeWeight(10);
background(204);
ellipseMode(RADIUS);
// Neck
stroke(102);
line(x+2, y-bodyHeight, x+2, ny);
line(x+12, y-bodyHeight, x+12, ny);
line(x+22, y-bodyHeight, x+22, ny);
line(x+1, y-bodyHeight, x+1, ny);
// Antennae
line(x+12, ny, x-26, ny-43);
line(x+12, ny, x+42, ny-99);
line(x+12, ny, x+78, ny+15);
// Body
noStroke();
fill(10);
ellipse(x, y-33, 33, 33);
fill(0);
rect(x-45, y-bodyHeight, 90, bodyHeight-33);
fill(200);
rect(x-45, y-bodyHeight+1, 90, 6);
// Head
fill(100); 
ellipse(x+12, ny, radius, radius);
fill(0);
ellipse(x+24, ny-6, 14, 14);
fill(0);
ellipse(x+24, ny-6, 3, 3);
fill(1);
ellipse(x, ny-8, 5, 5);
ellipse(x+0, ny-26, 4, 4); 
ellipse(x+41, ny+6, 3, 3);
