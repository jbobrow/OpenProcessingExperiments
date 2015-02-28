
float x = 60; // X-coordinate
float y = 440; // Y-coordinate
int radius = 45; // Head Radius
int bodyHeight = 160; // Body Height
int neckHeight = 70; // Neck Height
float easing = 0.02;
void setup() {
size(360, 480);
background (160);
smooth();
strokeWeight(2);

ellipseMode(RADIUS);
}
void draw() {
int targetX = mouseX;
x += (targetX - x) * easing;
if (mousePressed) {
  background (19);
neckHeight = 16;
bodyHeight = 90;
radius = 35;
strokeWeight(7);
} else {
neckHeight = 70;
bodyHeight = 160;
radius = 45;
background (190);
strokeWeight(2);
}
float ny = y - bodyHeight - neckHeight - radius;

// Neck
stroke(102);
line(x+12, y-bodyHeight, x+12, ny);
line(x+3, y-bodyHeight, x+3,ny);
line(x-5, y-bodyHeight, x-5,ny);
line(x-15, y-bodyHeight, x-15,ny);
line(x+20, y-bodyHeight, x+20, ny);
line(x+30, y-bodyHeight, x+30, ny);
// Antennae
line(x+12, ny, x-18, ny-43);
line(x+12, ny, x+42, ny-99);
line(x+12, ny, x+78, ny+15);
line(x+12, ny, x+80, ny+40);

line(x+6, ny, x-100, ny-30);
line(x+50, ny+4, x-30, ny-60);
// Body
noStroke();
fill(102);
ellipse(x, y-33, 33, 33);
fill(0);
rect(x-45, y-bodyHeight, 90, bodyHeight-33);
fill(102);
rect(x-45, y-bodyHeight,90, 25);
// Head
fill(0);
ellipse(x+12, ny, radius, radius);
fill(255);
ellipse(x+24, ny-6, 14, 14);
fill(0);
ellipse(x+24, ny-6, 3, 3);
fill(153);
ellipse(x-1, ny-6, 5, 5);
ellipse(x+45,ny, 3, 3);
ellipse(x+30, ny-30, 4, 4);
ellipse(x+10, ny-30, 6, 6);
ellipse(x, ny+20, 3, 3);

}

