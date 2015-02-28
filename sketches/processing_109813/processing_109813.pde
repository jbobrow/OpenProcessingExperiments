
PImage background;
PImage hand;
PImage hope;

int x;

void setup() {
  size(490, 759);
  background=loadImage("hopesmall.jpg");
  hand=loadImage("hand.png");
  hope=loadImage("hopeBan.jpg");
}

void draw() {
  image(background, 0, 0);

  if (mouseX>100&&mouseX<220) {
    image(hand, mouseX-255, 15);
    x=mouseX-255;
  }else{
    image(hand,x, 15);
  }

  image(hope, 0, 622);
}



