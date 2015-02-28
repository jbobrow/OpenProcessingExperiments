
//THE TWINS

float x = 60; 
float y = 440; 
int radius = 38; 
int bodyHeight = 150; 
int neckHeight = 80; 
float easing = 0.03;
void setup() {
size(450, 450);
smooth();
strokeWeight(3);
ellipseMode(RADIUS);


}
void draw() {
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
background(255);


// cuellos
stroke(102);
fill(193, 0, 0);
line(x+12, y-bodyHeight, x+12, ny);
fill(255, 0, 0);
line(x-12, y-bodyHeight, x-12, ny);


// brazos
fill(193, 193, 193);
line(x+1999, ny, x+78, ny+15);
fill(255, 0, 0);
line(-x+12, ny, x+78, ny+15);


// cuerpos
noStroke();
fill(201, 201, 201);
rect(x-65, y-bodyHeight, 60, bodyHeight-33);
fill(0);
rect(x+5, y-bodyHeight, 60, bodyHeight-33);


// cabezas
fill(0);
ellipse(x+32, ny, radius, radius);
fill(255);
ellipse(x+44, ny-6, 24, 24);
fill(50, 59, 210);
ellipse(x+44, ny-6, 13, 13);

fill(201, 201, 201);
ellipse(x-32, ny, radius, radius);
fill(255);
ellipse(x-44, ny-6, 24, 24);
fill(235, 239, 101);
ellipse(x-44, ny-6, 13, 13);
}

