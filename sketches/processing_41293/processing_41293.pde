
PImage foto1;
PImage foto2;

void setup() {
  size(550, 430);
  foto1 = loadImage("simpson1.jpg");
  foto2 = loadImage("simpson3.gif");
}

void draw() {
  image(foto1, -10, 0);
  fill(198, 49, 8);
  PFont LS;
  LS = loadFont("BROKENGHOST-48.vlw");
  textFont(LS);
  textSize(40);
  text("The Simpson's", 50, 55);
}

