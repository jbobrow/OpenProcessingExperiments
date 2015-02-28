
PShape robot1;
PShape robot2;
PImage landscape;
PFont font;

float easing = 0.05;
float offset = 0;
void setup() {
size(720, 480);
font = loadFont("ARHERMANN-48.vlw");
textFont(font);
robot1 = loadShape("robot1.svg");
robot2 = loadShape("robot2.svg");
landscape = loadImage("landscape1.png");
smooth();
}
void draw() {
// Set the background to the "landscape" image; this image
// must be the same width and height as the program
background(landscape);
textSize(40);
text("Good morning, guys", 100, 100);
// Set the left/right offset and apply easing to make
// the transition smooth
float targetOffset = map(mouseY, 0, height, -350, -150);
offset += (targetOffset - offset) * easing;
// Draw the left robot
shape(robot1, 460, 270 + offset, 120, 170);
// Draw the right robot smaller and give it a smaller offset
float smallerOffset = offset * 0.7;
shape(robot2, 420 + smallerOffset, 145, 230, 340);
// Draw the smallest robot, give it a smaller offset
}

