
PImage Me;
PImage flashlight;

void setup () {
  size(720, 525);
  frameRate(90);
}

void draw() {
  Me = loadImage("self_portrait.jpg");
  image(Me, 0, 0);
  flashlight = loadImage("flashlight_2.png");
  image(flashlight, mouseX-1100, mouseY-750);
}


