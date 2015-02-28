
PImage img;
float x = 60; // X-coordinate
float y = 440; // Y-coordinate
int radius = 45; // Head Radius
int bodyHeight = 160; // Body Height
int neckHeight = 70; // Neck Height
float easing = 0.02;
void setup() {
img = loadImage("robotflores.jpg");
size(900, 440);
smooth();
strokeWeight(2);
ellipseMode(RADIUS);
}
void draw() {
  image (img,0,0);
int targetX = mouseX;
 
x += (targetX - x) * easing;
if (mousePressed) {
neckHeight = 16;
bodyHeight = 90;
} else {
neckHeight = 70;
bodyHeight = 160;
}
float ny = y - bodyHeight - neckHeight - radius;

// Neck
fill(255,0,128);
strokeWeight (12);
stroke(102);
line(x+60, y-bodyHeight, x+12, ny);
// Antennae
fill(255,0,128);
line(x+12, ny, x-18, ny-43);
line(x+12, ny, x+42, ny-70);
line(x+12, ny, x+78, ny+15);
// Body
noStroke();
fill(202,251,4);
ellipse(x+52, y-33, 33, 33);
ellipse(x-52, y-33, 33, 33);
fill(211,65,44);
rect(x-45, y-bodyHeight, 45, bodyHeight-33);
rect(x-90, y-bodyHeight, 180 , bodyHeight-33);
ellipse(x-90,y-bodyHeight, 25,25);
 
// Head
fill(255,0,128);
ellipse(x+12, ny, radius, radius);
fill(255);
ellipse(x+34, ny-6, 14, 14);
fill(0);
ellipse(x+34, ny-6, 3, 3);
}


