
float x = 60; // X-coordinate
float y = 440; // Y-coordinate
int radius = 60; // Head Radius
int bodyHeight = 160; // Body Height
int neckHeight = 70; // Neck Height
float easing = 0.02;
PImage img;

void setup() {
  size(700, 480);
  img = loadImage("alpine.png");
  smooth();
  ellipseMode(RADIUS);
}

void draw() {
  image(img, 0, 0);
int targetX = mouseX;
x += (targetX - x) * easing;
if (mousePressed) {
neckHeight = 50;
bodyHeight = 50;
} else {
neckHeight = 70;
bodyHeight = 160;
}
float ny = y - bodyHeight - neckHeight - radius;

// Neck
stroke(0);         
line(x, y-bodyHeight, x+12, ny);
// Body
noStroke();
fill(500,200,100); 
rect (x+10, y-33, 20, bodyHeight-33);
rect (x-30, y-33, 20, bodyHeight-33);
fill(0,0,255); 
rect(x-45, y-bodyHeight, 90, bodyHeight-33);
fill(0);
rect(x-45, y-bodyHeight-200, 5, 200);
rect(x+45, y-bodyHeight+10, 150, 5);
// Head
fill(500,200,100);   
ellipse(x+12, ny, radius+5, radius+20);
fill(0);
ellipse(x+55, ny-20, 30, 30);
ellipse(x-30, ny-20, 30, 30);
rect(x, ny+30, 30, 3);
fill(255);
ellipse(x+45, ny-6, 7, 7);
ellipse(x-20, ny-6, 7, 7);

}

