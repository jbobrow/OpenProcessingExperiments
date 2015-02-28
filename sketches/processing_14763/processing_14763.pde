
PImage img;
float x = 60; // X-coordinate
float y = 440; // Y-coordinate
int radius = 45; // Head Radius
int bodyHeight = 160; // Body Height
int neckHeight = 70; // Neck Height
float easing = 0.02;
void setup() {
  img = loadImage ("marilyn.jpg");
size(500, 411);
smooth();
strokeWeight(10);


ellipseMode(RADIUS);
}
void draw() {
  image (img, 0, 0); 
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


stroke(20,54,226);
line(x+12, y-bodyHeight, x+12, ny);

line(x+90, ny, x-50, ny-90);
line(x+12, ny, x+42, ny-99);
line(x+12, ny, x+78, ny+15);

noStroke();
fill(185,226,20);
ellipse(x, y-100, 100, 100);
fill(175,20,226);
ellipse(x, y-10, 50, 50);
fill(226,88,20);



fill(175,20,226);
ellipse(x+40, ny, radius, radius);
fill(255);
ellipse(x+24, ny-6, 14, 14);
fill(0);
ellipse(x+24, ny-6, 3, 3);

fill(226,224,20);
ellipse(x+90, ny, radius, radius);
fill(255);
ellipse(x+90, ny-6, 14, 14);
fill(0);
ellipse(x+90, ny-6, 3, 3);
}


