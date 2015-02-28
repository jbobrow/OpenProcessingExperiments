
int x = 120;
int y = 60;
int radius = 12;
void setup() {
 size(240, 120); 
 smooth();
 ellipseMode(RADIUS);
}
void draw() {
 background(255, 208, 113);
 float d = dist(mouseX, mouseY, x, y);
 if (d < radius) {
 radius++;
 fill(70, 255, 62); 
 } else {
 fill(62, 189, 255);
 }
 ellipse(x, y, radius, radius);
}
