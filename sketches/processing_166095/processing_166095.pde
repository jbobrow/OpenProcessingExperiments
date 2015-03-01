
float angle = 0.0; // Changing angle
float speed = 0.05; // Speed of growth
void setup() {
size(400, 400);
noStroke();
}
void draw() {
background(0);
circlePhase(0.0);
circlePhase(QUARTER_PI);
circlePhase(HALF_PI);
angle += speed;
}
void circlePhase(float phase) {
float diameter = 65 + (sin(angle + phase) * 45);
fill(250,150,100,120);
ellipse(200, 200, diameter*2, diameter*2);
fill(100,150,250,120);
ellipse(200, 200, diameter*(angle%3), diameter*(angle%3));
fill(100,250,150,80);
ellipse(200, 200, diameter*(angle%5), diameter*(angle%5));
fill(250,250,100,60);
ellipse(200, 200, diameter*3, diameter*3);
}


