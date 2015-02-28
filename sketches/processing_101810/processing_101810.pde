
int x = 120;
int y = 60;
int radius = 12;
void setup() {
size(240, 120);
smooth();
ellipseMode(RADIUS);
}
void draw() {
background(200, 400, 600);
float d = dist(mouseX, mouseY, x, y);
if (d < radius) {
radius++;
fill(123, 234, 345);
} else {
fill(255, 555, 755);
}
ellipse(x, y, radius, radius);
}
