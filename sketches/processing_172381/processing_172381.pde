
float y = 0.0;
float radius = 20.0;
float velocity = 0.0;
float acceleration = 0.008;
void setup() {
size(300, 300);
smooth();
noStroke();

}
void draw() {
fill(0, 10);
rect(0, 0, width, height);
fill(20, 55, 150);
ellipse(20, y, radius/2, radius);
ellipse (40, y, radius, radius);
ellipse (60, y, radius/2, radius);
ellipse (80, y, radius, radius);
ellipse (100, y, radius/2, radius);
ellipse (120, y, radius, radius);
ellipse (140, y, radius/2, radius);
ellipse (160, y, radius, radius);
ellipse (180, y, radius/2, radius);
ellipse (200, y, radius, radius);
ellipse (220, y, radius/2, radius);
ellipse (240, y, radius, radius);
ellipse (260, y, radius/2, radius);
ellipse (280, y, radius, radius);

velocity += acceleration; // Increase the velocity
y += velocity; // Update the position
if (y > height+radius) { // If over the bottom edge,
y = -radius; // move to the top
}
}


