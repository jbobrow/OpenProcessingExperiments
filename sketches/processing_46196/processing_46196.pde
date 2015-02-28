
PImage rock;
PImage mouseovermap;
PImage cursor_water, cursor_sandball, cursor_C, cursor_F, cursor_grass, cursor_shadow, cursor_shovel, cursor_hammer, cursor_foundation, cursor_sand, cursor_semicircle, cursor_excavate, cursor_hand, cursor_handgrey, cursor_feetmove, cursor_pickaxe;
color g;


void setup() {
  noCursor();
  mouseovermap = loadImage("rocktemp.jpg");
  rock = loadImage("rock06.jpg");
  cursor_hand = loadImage("cursor_hand.png");
  cursor_handgrey = loadImage("cursor_handgrey.png");
  cursor_feetmove = loadImage("cursor_feetmove.gif");
  cursor_pickaxe = loadImage("cursor_pickaxe.gif");
  cursor_hammer = loadImage("cursor_hammer.png");
  cursor_shovel = loadImage("cursor_shovel.png");
  cursor_semicircle = loadImage("cursor_semicircle.png");
  cursor_shadow = loadImage("cursor_shadow.png");
  cursor_excavate = loadImage("cursor_excavate.gif");
  cursor_foundation = loadImage("cursor_foundation.gif");
  cursor_sand = loadImage("cursor_sand.png");
  cursor_grass = loadImage("cursor_grass.png");
  cursor_water = loadImage("cursor_water.png");
  cursor_C = loadImage("cursor_C.gif");
  cursor_F = loadImage("cursor_F.png");
  size(800, 578);
}

void draw() {
  image(rock, 0, 0);

  //text(brightness(g), 100, 380);
  g = mouseovermap.get(mouseX, mouseY); //get color under pointer from this image from vicente on http://processing.org/discourse/yabb2/YaBB.pl?num=1225716735
  if (brightness(g)==84) {
    image(cursor_handgrey, mouseX-8, mouseY-8);
  }
  if (brightness(g)==0) {
    image(cursor_hammer, mouseX-8, mouseY-8);
  }
  if (brightness(g)==204) {
    image(cursor_feetmove, mouseX-8, mouseY-8);
  }
  if (brightness(g)==255) {
    image(cursor_sand, mouseX-8, mouseY-8);
  }
  if (brightness(g)==25 || brightness(g)==56 || brightness(g)==58) {
    image(cursor_shadow, mouseX-8, mouseY-8);
  }
  if (brightness(g)==102) {
    image(cursor_foundation, mouseX-8, mouseY-8);
  }
  if (brightness(g)==40) {
    image(cursor_water, mouseX-8, mouseY-8);
  }
  if (brightness(g)==30 || brightness(g)==178 || brightness(g)==119 || brightness(g)==127 || brightness (g) == 61 || brightness(g)==142 || brightness(g)==153) {
    image(cursor_grass, mouseX-8, mouseY-8);
  }
  if(brightness(g)==20 || brightness(g) ==82){
  image(cursor_shovel, mouseX-8, mouseY-8);
  }
  if(brightness(g)==38 || brightness(g)==43 || brightness(g) == 51 ){
  image(cursor_pickaxe, mouseX-8, mouseY-8);
  }
}


