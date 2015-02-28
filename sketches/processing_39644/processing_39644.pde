
void setup() {
size(600, 600);
colorMode(HSB, 200);
background(200);
smooth();
}

void draw() {
noStroke();
fill(random(10), 100, 100, 100);
rect(mouseX, mouseY, random(10), pmouseY);
}

void mousePressed() {
background(200);
}

