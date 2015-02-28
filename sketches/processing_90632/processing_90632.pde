
float x = 0.0; 
float y = 50.0; 
float angle = 0.2; 
float speed = 0.5; 

void setup() {
size(100, 100);
background(0);
randomSeed(160); 
}

void draw() {
angle += random(-0.3, 0.3);
x += cos(angle) * speed; // Update x-coordinate
y += sin(angle) * speed; // Update y-coordinate
translate(x, y);
rotate(angle);
noStroke();
fill(random(255), 0, random(255), 150);
rect(0, 0, 10, 30);
rect(0, 0, 30, 10);
}
