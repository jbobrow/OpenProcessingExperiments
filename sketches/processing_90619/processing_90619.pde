
int moveX, moveY, dragX, dragY;

void setup() {
size(400, 400);
noStroke();
fill(255, 200);
}

void draw() {
background(0);
rect(moveX, moveY, dragX, dragY);
ellipse(dragX, dragY, moveX, moveY);
}

void mouseDragged() {
dragX= mouseX;
dragY= mouseY;
}

void mouseMoved() {
moveX= mouseX;
moveY= mouseY;
}
