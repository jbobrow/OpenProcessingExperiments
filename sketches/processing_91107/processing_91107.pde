
void setup() {
size(255, 255);
}
void draw() {
background(0);
noStroke();
fill(255-mouseX, 255-mouseX, 255);
rectMode(CENTER);
rect(width/2, height/2, mouseX, mouseX);
}
