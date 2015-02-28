
float angle = 0.0;
void setup() {
size(300, 300);
smooth();
noStroke();
background(255);
}
void draw() {
rotate(angle);
translate(mouseX, mouseY);
fill(random(200),random(200),random(255),80);
ellipse(-15, -15, 10, 10);
angle += 0.1;
}

