
PImage img;
PImage img2;
PFont font;

void setup() {
size(320, 480);
img2 = loadImage("obstacle2.png");
img = loadImage("background.png");
font = loadFont("sofiaregular.ttf");
textFont(font, 32);

}
void draw() {
image (img, 1, 1);
image (img2, 20, 20);
stroke(0);
textSize(60);
text ("WELCOME", 10, 130);


}



