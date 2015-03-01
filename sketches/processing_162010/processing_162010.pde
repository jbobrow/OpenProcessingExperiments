
PImage myImage;
PFont myFont;
int value = 0;

void setup() {
  size(676,501);
  background(0,0,0);
  myImage = loadImage("jol11.GIF");
  myFont = loadFont("MingLiU-30.vlw");
}

void draw() {
  image(myImage,0,0);
  tint(value);
  textSize(45);
  fill(255);
  text("TROJAN PUMPKIN CARVING",60,250);
  fill(255);
  text("TROJAN PUMPKIN CARVING",60,250);
  textSize(30);
  text("Friday, October 24th at 7:00PM",110,280);
  textSize(20);
  text("Join the Environmental Student Assembly at the USB Urban Garden",25,310);
  text("For an evening of pumpkin carving fun!",150,340);
  text("BYO Pumpkin - carving utensils provided",150,370);
}
void mouseMoved() {
  value = value + 255;
  if (value > 255) {
    value = 0;
  }
}


