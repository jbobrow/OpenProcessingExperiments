
float x = 60; // X-coordinate
float y = 440; // Y-coordinate
int radius = 80; // Head Radius
int bodyHeight = 160; // Body Height
int neckHeight = 70; // Neck Height
float easing = 0.059;
void setup() {
size(700, 500);
smooth();
strokeWeight(2);
ellipseMode(RADIUS);
}
void draw() {
int targetX = mouseX;
x += (targetX - x) * easing;
if (mousePressed) {
neckHeight = 86;
bodyHeight = 90;
} else {
neckHeight = 70;
bodyHeight = 160;
}
float ny = y - bodyHeight - neckHeight - radius;
background(204);
// Neck
stroke(155);
line(x+2, y-bodyHeight, x+2, ny);
line(x+12, y-bodyHeight, x+12, ny);
line(x+22, y-bodyHeight, x+22, ny);

// Antennae
background (25,102,10);
line(x+12, ny, x-28, ny+43);
line(x+10, ny, x+42, ny+200);
line(x+10, ny, x+78, ny+185);
line(x+13, ny, x+48, ny+155);
line(x+12, ny, x-18, ny+43);
line(x+10, ny, x+42, ny+140);
line(x+10, ny, x+78, ny+140);
line(x+13, ny, x+38, ny+130);


// Body
noStroke();
fill(102);
ellipse(x, y-33, 33, 33);
fill(0);
rect(x-45, y-bodyHeight, 90, bodyHeight-33);
fill(102);
rect(x-45, y-bodyHeight+17, 90, 6);

// Head
rect(x-30, y-bodyHeight+20, 75, 6);
rect(x-30, y-bodyHeight+30, 75, 6);
rect(x-30, y-bodyHeight+40, 75, 6);
rect(x-30, y-bodyHeight+50, 75, 6);
rect(x-30, y-bodyHeight+60, 75, 6);
rect(x-30, y-bodyHeight+70, 75, 6);
rect(x-30, y-bodyHeight+80, 75, 6);


fill(255);
ellipse(x-22, ny-80, radius, radius);
fill(0);
ellipse(x-22, ny-20, radius, radius);
fill(255);
ellipse(x+24, ny-6, 14, 14);
ellipse(x-74, ny-6, 14, 14);
fill(20);
ellipse(x+24, ny-6, 3, 3);
ellipse(x-74, ny-6, 3, 3);
fill(35);
ellipse(x, ny-8, 5, 5);
ellipse(x+30, ny-26, 4, 4);
ellipse(x+35, ny+6, 3, 3);

}

