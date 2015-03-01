
int dragX, dragY, moveX, moveY;
void setup() {
size(500, 500);
background(0);
}
void draw() {
//background(0);
//fill(150,135,240,30);
stroke(50,50);
//noStroke();
line(dragX, dragY, pmouseX, pmouseY);
stroke(210,245,135,10);
strokeWeight(5);
line(moveX, moveY, pmouseX, pmouseY);
}
void mouseMoved() {
moveX = mouseX;
moveY = mouseY;
}
void mouseDragged() {
dragX = mouseX;
dragY = mouseY;
}


