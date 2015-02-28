
float x = 60; // X-coordinate
float y = 440; // Y-coordinate
int radius = 80; // Head Radius
int bodyHeight = 160; // Body Height
int neckHeight = 70; // Neck Height
float easing = 0.059;
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
neckHeight = 86;
bodyHeight = 90;
} else {
neckHeight = 70;
bodyHeight = 160;
}
float ny = y - bodyHeight - neckHeight - radius;
background(204);
// Neck
stroke(102);
line(x+12, y-bodyHeight, x+12, ny);
// Antennae
fill(250,0,0);
line(x+12, ny+90, x-90, ny-43);
line(x+12, ny, x-100, ny-10);
line(x+12, ny, x-110, ny+15);
line(x+12, ny, x-80, ny-80);
line(x+12, ny+90, x-60, ny-110);
line(x+12, ny, x-30, ny-120);
line(x+12, ny, x-0, ny-125);
line(x+12, ny+100, x+30, ny-130);
line(x+120, ny+90, x-90, ny-43);

// Body
noStroke();
fill(102);
ellipse(x, y-33, 33, 33);
fill(96,132,19);
rect(x-45, y-bodyHeight, 90, bodyHeight-33);
fill(120,50,90);
ellipse(x-45, y-bodyHeight, 90, bodyHeight-33);
// Head
fill(154,214,31);
ellipse(x+12, ny, radius, radius);
fill(255);
ellipse(x+24, ny-6, 14, 14);
fill(10,250,80);
ellipse(x+24, ny-6, 10, 10);
fill(210,60,55);
ellipse(x+24, ny-6, 8, 8);
fill(0);
ellipse(x+24, ny-6, 3, 3);
fill(250,0,0);
ellipse(x+40, ny-70, 30, 30);
fill(234,230,57);
ellipse(x+90, ny-0, 50, 30);
}


