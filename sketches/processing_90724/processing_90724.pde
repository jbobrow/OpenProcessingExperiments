
PImage img;
void setup() {
size(100, 100);
img = loadImage("board.jpg");
img.loadPixels();
stroke(230, 0, 50);
}
void draw() {
background(200);
int my = constrain(mouseY, 0, 99);
for (int i = 0; i < img.height; i++) {
color c = img.pixels[my*width + i]; // Get a pixel
float r = red(c); // Get the red value
line(i, 0, i, height/2 + r/6);
}
}


