
float x = 600; // X-coordinate
float y = 440; // Y-coordinate
int radius = 80; // Head Radius
int bodyHeight = 60; // Body Height
int neckHeight = 70; // Neck Height
float easing = 0.02;
void setup() {
size(500, 500);
smooth();
strokeWeight(50);
ellipseMode(CORNER);
}
void draw() {
int targetX = mouseX;
x += (targetX - x) * easing;
if (mousePressed) {
neckHeight = 20;
bodyHeight = 45;
} else {
neckHeight = 150;
bodyHeight = 100;
}
float ny = y - bodyHeight - neckHeight - radius;
background(100);
// Neck
stroke(300);
line(x+12, y-bodyHeight, x+2, ny);
// Antennae
line(x+5, ny, x-8, ny-3);
line(x+5, ny, x+4, ny-9);
line(x+5, ny, x+7, ny+5);
// Body
noStroke();
fill(102);
ellipse(x, y-33, 33, 33);
fill(300);
rect(x-45, y-bodyHeight, 5, bodyHeight-10);
// Head
fill(250,255,0);
ellipse(x+5, ny, radius, radius--);
if (mousePressed)
{ellipse(x,y-8,5,5);
fill(255);
ellipse(x+10, ny-6, 14, 14);
fill(255);
ellipse(x+10, ny-6, 3, 3);
}
}

