
int x = 100; // x-coordinate
int y = 440; // y-coordinate
int bodyHeight = 200; // Body Height
int neckHeight = 60; // Neck Height
int radius = 60; // Head Radius
int wheel = 60; // Wheel Size
int eye = 8; // Eye Size
int ny = y - bodyHeight - neckHeight - radius; // Neck Y
size(200, 500);
smooth();
strokeWeight(3);
background(204);
ellipseMode(RADIUS);
// Neck
stroke(random(255),100,255,50);
line(x+2, y-bodyHeight, x+2, ny+(radius));
line(x+12, y-bodyHeight, x+12, ny+(radius));
line(x+22, y-bodyHeight, x+22, ny+(radius));
// Antennae
line(x+15, ny-(radius), x-18, ny-80);
line(x+17, ny-(radius), x+42, ny-99);
line(x+18, ny-(radius), x+78, ny-70);
// Body
noStroke();
fill(random(255),100,255,50);
ellipse(x, y-33, wheel, wheel);
fill(random(255),100,255,50);
rect(x-45, y-bodyHeight, 90, bodyHeight-33);
fill(random(255),100,255,50);
rect(x-45, y-bodyHeight+17, 90, 6);
// Head
fill(random(255),100,255,50);
ellipse(x+12, ny, radius, radius);
fill(255);
ellipse(x+24, ny-6, eye, eye);
fill(0);
ellipse(x+24, ny-6, eye-2, eye-2);
fill(153);
ellipse(x, ny-8, 5, 5);
ellipse(x+30, ny-26, 4, 4);
ellipse(x+41, ny+6, 3, 3);
