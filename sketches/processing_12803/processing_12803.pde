
int x = 70; // x-coordinate
int y = 400; // y-coordinate
int bodyHeight = 100; // Body Height
int neckHeight = 150; // Neck Height
int radius = 28; // Head Radius
int ny = y - bodyHeight - neckHeight - radius; // Neck Y
size(200, 490);

smooth();
strokeWeight(2);
background(255);
ellipseMode(RADIUS);

// Neck
stroke(102);
line(x+6, y-bodyHeight, x+2, ny);
line(x+20, y-bodyHeight, x+12, ny);
line(x+36, y-bodyHeight, x+22, ny);
// Antennae
line(x+30, ny, x-20, ny-43);
line(x+12, ny, x+48, ny-99);
line(x+12, ny, x+82, ny+15);

// Body
noStroke();
fill(0);
ellipse(x, y-33, 33, 33);
fill(137, 116, 122);
ellipse(x-30, ny, radius, radius);
fill(137, 116, 122);
rect(x-45, y-bodyHeight+17, 90, 90);
fill(250, 18, 91);
rect(x-45, y-bodyHeight+17, 90, 6);
fill(137, 116, 122);
ellipse(x+70, ny, radius, radius);


// Head
fill(183, 170, 174);
ellipse(x+12, ny, radius, radius);
fill(137, 116, 122);
ellipse(x+24, ny-6, 14, 14);
fill(227,250,247);
ellipse(x+24, ny-6, 3, 3);
fill(255,54,118);
ellipse(x, ny-8, 5, 5);
ellipse(x+30, ny-26, 4, 4);
ellipse(x+41, ny+6, 3, 3);

