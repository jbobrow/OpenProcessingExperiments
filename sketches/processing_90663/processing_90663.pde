
PImage img1, img2;
void setup() {
size(400, 400);
img1 = loadImage("balloon.jpg");
img2 = loadImage("board.jpg");
}
void draw() {
background(255);
image(img1, 0, -50);
int mx = constrain(mouseX, 0, 400);
int my = constrain(mouseY, 0, 400);
copy(img2, mx, my, 75, 75, mx, my, 75, 75);
}


