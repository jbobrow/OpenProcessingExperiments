

float x = 60; // X-coordinate
float y = 440; // Y-coordinate
int radius = 45; // Head Radius
int bodyHeight = 160; // Body Height
int neckHeight = 70; // Neck Height
float easing = 0.02;
void setup() {
size(360, 480);
smooth();
strokeWeight(2);
ellipseMode(RADIUS);
}
void draw() {
int targetX = mouseX;
x += (targetX - x) * easing;
if (mousePressed) {
neckHeight = radius++;
bodyHeight = 90;
} else {
neckHeight = 70;
bodyHeight = 160;
}
float ny = y - bodyHeight - neckHeight - radius;
background(232, 254, 253);

// Neck
stroke(102);
line(x+12, y-bodyHeight, x+12, ny);



// Body
noStroke();
fill(170, 218, 255);
ellipse(99, y-33, 33, 33);
fill(255, 242, 254);
rect(x-60, y-bodyHeight, 120, bodyHeight-54);

// Head
fill(204, 250, 212);
ellipse(x++, ny, radius, radius);
fill(255);
ellipse(x+24, ny++, 14, 14);
fill(255, 224, 250);
ellipse(x+24, ny-6, radius, 3);
}

