
PImage bg;
PImage shine;

void setup() {
  size (500, 500);
  shine = loadImage("shine.png");
}


void draw() {

  bg = loadImage("face.png");
  background(bg);

  float leftXpos = map (mouseX, 0, 500, -5, -0);
  float leftYpos = map (mouseY, 0, 500, -5, 0);
  image(shine, leftXpos, leftYpos);
}



