
float x = 60; // X-coordinate
float y = 440; // Y-coordinate
int radius = 45; // Head Radius
int bodyHeight = 160; // Body Height
int neckHeight = 70; // Neck Height
float easing = 0.02;
void setup() {
size(360, 480);
smooth();
strokeWeight(5);
ellipseMode(RADIUS);
}
void draw() {
int targetX = mouseX;
x += (targetX - x) * easing;
if (mousePressed) {
neckHeight = 20;
bodyHeight = 100;
} else {
neckHeight = 80;
bodyHeight = 170;
}
float ny = y - bodyHeight - neckHeight - radius;
background(0);
// Neck
stroke(112);
line(x-10, y-bodyHeight, x-10, ny);
// Antennae
line(x+20, ny, x-5, ny-60);
line(x+12,ny,x+78,ny+15);
line(x+40, ny, x+80, ny+30);
// Body
noStroke();
fill(255,120,0);
ellipse(x-20, y-50, 10, 10);
fill(255,120,0);
ellipse(x+5, y-50, 10, 10);
fill(228,255,0);
ellipse(x-25, y-bodyHeight, 30, bodyHeight-60);
// Head
fill(228,255,0);
ellipse(x+12, ny, radius, radius);
fill(255);
ellipse(x+24, ny-6, 14, 14);
fill(0,0,255);
ellipse(x+24, ny-6, 8, 8);
fill(0);
ellipse(x+24, ny-6, 3, 3);
}

