
/* @pjs preload="hamster.jpg,explode.jpeg"; */

PImage img1, img2;
void setup() {
size(300, 200);
img1 = loadImage("explode.jpeg");
img2 = loadImage("hamster.jpg");
}
void draw() {
background(255);
image(img1, 0, 0,300,225);
int my = constrain(mouseY, 0, 167);
copy(img2, 0, my, 300, 33, 0, my, 300, 39);
}


