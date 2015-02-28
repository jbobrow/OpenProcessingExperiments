
// Constants
PImage world;
PImage CenterPic;
PImage CenterPic2;
PImage CenterPic3;
PImage CenterPic4;
PImage Center5;
PImage CenterPic6;
PImage CenterPic7;
PImage CenterPic8;
PImage CenterPic9;
PImage CenterPic10;
PImage CenterPic11;

int Y_AXIS = 1;
int X_AXIS = 2;
color b1, b2, c1, c2;

void setup() {
  size(800, 360);
  smooth();
  noStroke();
  world = loadImage ("world.png");
  CenterPic = loadImage ("CenterPic.gif");
  CenterPic2 = loadImage ("CenterPic2.gif");
  CenterPic3 = loadImage ("CenterPic3.gif");
  CenterPic4 = loadImage ("CenterPic4.gif");
  Center5 = loadImage ("Center5.gif");
  CenterPic6 = loadImage ("CenterPic6.gif");
  CenterPic7 = loadImage ("CenterPic7.gif");
  CenterPic8 = loadImage ("CenterPic8.gif");
  CenterPic9 = loadImage ("CenterPic9.gif");
  CenterPic10 = loadImage ("CenterPic10.gif");
  CenterPic11 = loadImage ("CenterPic11.gif");

  // Define colors
  b1 = color(255, 0, 0);
  b2 = color(255, 72, 0);
  c1 = color(255, 7, 0);
  c2 = color(255, 234, 0);

  noLoop();
}

void draw() {
  // Foreground
  background(255);
  setGradient(705, 90, 50, 200, c1, c2, Y_AXIS);
  image (world, 0, 0, 640, 360);
  noStroke();

  fill(98, 163, 178);
  ellipse(122, 155, 21, 21);
  ellipse(144, 170, 10, 10);
  ellipse(165, 186, 15, 15);
  ellipse(198, 172, 14, 14);
  ellipse(154, 173, 4, 4);
  ellipse(218, 241, 46, 46);
  ellipse(198, 217, 5, 5);
  ellipse(340, 201, 14, 14);
  ellipse(411, 134, 9, 9);
  ellipse(496, 158, 37, 37);
  ellipse(532, 172, 16, 16);
  ellipse(526, 216, 17, 17);

  {
    if ((mouseX>132)&&(mouseX<112)&&(mouseY>165)&&(mouseY<145)) {
      image (CenterPic, 200, 200, 380, 250);
    }
    if ((mouseX>149)&&(mouseX<139)&&(mouseY>175)&&(mouseY<165)) {
      image (CenterPic2, 200, 200, 380, 250);
    }
    if ((mouseX>173)&&(mouseX<157)&&(mouseY>196)&&(mouseY<178)) {
      image (CenterPic3, 200, 200, 380, 250);
    }
    if ((mouseX>156)&&(mouseX<152)&&(mouseY>175)&&(mouseY<172)) {
      image (CenterPic4, 200, 200, 380, 250);
    }
    if ((mouseX>200)&&(mouseX<196)&&(mouseY>219)&&(mouseY<215)) {
      image (Center5, 200, 200, 380, 250);
    }
    if ((mouseX>348)&&(mouseX<332)&&(mouseY>209)&&(mouseY<193)) {
      image (CenterPic6, 200, 200, 380, 250);
    }
    if ((mouseX>415)&&(mouseX<407)&&(mouseY>138)&&(mouseY<146)) {
      image (CenterPic7, 200, 200, 380, 250);
    }
    if ((mouseX>522)&&(mouseX<475)&&(mouseY>182)&&(mouseY<134)) {
      image (CenterPic8, 200, 200, 380, 250);
    }
    if ((mouseX>540)&&(mouseX<524)&&(mouseY>180)&&(mouseY<164)) {
      image (CenterPic9, 200, 200, 380, 250);
    }
    if ((mouseX>534)&&(mouseX<518)&&(mouseY>0)&&(mouseY<300)) {
      image (CenterPic10, 200, 200, 380, 250);
    }
    if ((mouseY>534)&&(mouseY<518)&&(mouseX>224)&&(mouseX<208)) {
      image (CenterPic11, 200, 200, 380, 250);
    }
  }
}
void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }
}


