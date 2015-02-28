
PShape bot1;
PImage landscape;

float easing = 0.05;
float offset = 0;

void setup(){
  size(1184,780);
  bot1 = loadShape("TinMan.svg");
  landscape = loadImage("yellow.jpeg");
  smooth();
}

void draw() {
// Set the background to the "landscape" image; this image
// must be the same width and height as the program
background(landscape);
// Set the left/right offset and apply easing to make
// the transition smooth
float targetOffset = map(mouseY, 0, height, -40, 40);
offset += (targetOffset - offset) * easing;
// Draw the left robot
shape(bot1, 85 + offset, 65);
// Draw the right robot smaller and give it a smaller offset


}

