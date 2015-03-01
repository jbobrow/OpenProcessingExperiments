
String txt="AT";
PImage img;
PFont fnt;
int small, big;

void setup() {
  size(354, 472, P3D);
  background(255);
  img = loadImage("me.jpg");
  small = 4;
  big = 10;
  fnt = loadFont("AppleSDGothicNeo-Regular-48.vlw");
  noStroke();
}

void draw() {
  //background(255);
  for (int i=0; i<50000; i++) {
    float txtsize = map(mouseX, 0, width, small, big);
    int x = int(random(img.width));
    int y = int(random(img.height));
    int z = int(random(-5, 5));
    color pix = img.get(x, y);
    fill(pix, 128);
    textFont(fnt);
    textSize(txtsize);
    text(txt, x, y, z);
  }
  camera(mouseX, mouseY, width/2, width/2, height/2, 0, 0, 1, 0);
}


