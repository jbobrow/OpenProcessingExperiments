
PImage img;
 
float x = 60; // X-coordinate
float y = 440; // Y-coordinate
int radius = 45; // Head Radius
int bodyHeight = 160; // Body Height
int neckHeight = 70; // Neck Height
float easing = 0.02;
 
void setup() {
size(500, 500);
img = loadImage("gato1.jpg");
 
ellipseMode(RADIUS);
}
void draw() {
image(img,0,0);
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
 
// Neck
stroke(102);
line(x+12, y-bodyHeight, x+12, ny);
// Antennae
line(x+12, ny, x-18, ny-43);
line(x+12, ny, x+62, ny-99);
line(x+12, ny, x+78, ny+15);
// Body
noStroke();
fill(191,113,9);
ellipse(x, y-33, 33, 33);
fill(16,72,50);
rect(x-70, y-bodyHeight, 90, bodyHeight-33);
// Head
fill(82,67,173);
ellipse(x+80, ny, radius, radius);
fill(122);
ellipse(x, y-33, 33, 50);
fill(0);
ellipse(x+24, ny-6, 10, 10);
fill(122);
ellipse(x, ny-8, 5, 5);
ellipse(x+30, ny-26, 4, 4);
ellipse(x+41, ny+6, 3, 3);
  
  
 
  
  
  
}

