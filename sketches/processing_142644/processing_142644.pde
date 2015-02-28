
void setup() {
size(500, 500);
background(0);
noStroke();
}

void draw() {
fill(255);
background(0);
ellipseMode(RADIUS);
ellipse(mouseX,mouseY,120,120);
pushMatrix();
fill(0);
rectMode(CENTER);
translate(width/2, height/2);
rotate(radians(45));
rect(0, 0, 75, 300);
rotate(radians(90));
rect(0, 0, 75, 300);
popMatrix();
}
