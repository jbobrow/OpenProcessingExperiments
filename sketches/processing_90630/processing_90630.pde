
float angle = 0.0;
float speed = 0.1;
void setup() {
size(125, 100);
noStroke();
smooth();
}

void draw() {
background(0);
angle = angle + speed;
rectMode(CENTER);
fill(250, 170);
rect(10, 50 + (sin(angle + TWO_PI) * 5), 25, 3);
fill(220, 170);
rect(25, 50 + (sin(angle + QUARTER_PI + HALF_PI + PI) * 5), 25, 3);
fill(180, 170);
rect(40, 50 + (sin(angle + HALF_PI + PI) * 5), 25, 3);
fill(150, 170);
rect(55, 50 + (sin(angle + QUARTER_PI + PI) * 5), 25, 3);
fill(120, 170);
rect(70, 50 + (sin(angle + PI) * 5), 25, 3);
fill(100, 170);
rect(85, 50 + (sin(angle + HALF_PI + QUARTER_PI) * 5), 25, 3);
fill(80, 170);
rect(100, 50 + (sin(angle + HALF_PI) * 5), 25, 3);
fill(45, 170);
rect(115, 50 + (sin(angle + QUARTER_PI) * 5), 25, 3);
}
