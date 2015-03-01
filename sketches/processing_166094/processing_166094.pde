
float angle = 0.0; // Current angle
float speed = 0.05; // Speed of motion
float radius = 60.0; // Range of motion
float sx = 2.0;
float sy = 2.0;
void setup() {
size(400, 400);
noStroke();
}
void draw() {
fill(0, 8);
rect(0, 0, width, height);
angle += speed; // Update the angle
float sinval = sin(angle);
float cosval = cos(angle);
// Set the position of the small circle based on new
// values from sine and cosine
float x = 180 + (cosval * radius);
float y = 180 + (sinval * radius);
fill(120,180,190,80);
ellipse(x, y, 30, 30); // Draw smaller circle
// Set the position of the large circles based on the
// new position of the small circle
float x2 = x + cos(angle * 3) * radius/2;
float y2 = y + sin(angle * 3) * radius/2;
fill(250,190,100,120);
ellipse(x2, y2, 60, 60); // Draw larger circle

float w = x + sin(angle) * 300;
x2 = x + cos(angle * 2) * radius*3;
y2 = y + sin(angle * 2) * radius*3;
fill(50,190,100,20);
ellipse(w, w, 1000, 160); // Draw larger circle
}


