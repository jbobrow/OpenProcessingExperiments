
int counter;
int value = 50;
void setup() {
size(500, 500);
background(255); 
colorMode(RGB); 
counter = 0;
}
void draw() { 
if (mousePressed && (mouseButton == LEFT)) {
fill(255);
ellipse(mouseX, mouseY, 50, 50);
} else if (mousePressed && (mouseButton == RIGHT)) {
fill(127);
rect(mouseX, mouseY, 50, 50);
} else if (mousePressed && (mouseButton == CENTER)){
fill(0);
triangle(mouseX, mouseY, mouseX+20, mouseY+20, mouseX+40, mouseY-40)
}
}
