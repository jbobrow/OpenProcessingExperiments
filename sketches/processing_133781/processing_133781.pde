
float r;
float g;
float b;
float a;

float diam;
float x;
float y;

void setup() {
size (400, 400);
background(255);
smooth();
frameRate(10);
}

void draw() {
r = random(255);
g = random(255);
b = random(255);
a = random(255);
diam = random(100);
x = random(width);
y = random(height);

noStroke();
fill(r, g, b, a); //4th value is for alpha
ellipse(x, y, diam, diam);
}
