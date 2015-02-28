

FancyButton g;

void setup() {
  size(100, 100);
  textAlign(CENTER, CENTER);
  g = new FancyButton();
}

void draw() {
  background(255);
  g.iRect(0, 25, 25, 50, 50, 10, color(0, 0, 0), color(100, 100, 200), "APP");
}

class FancyButton {

  int largeNum = 100;  //  this is how many buttons this class can make
  PImage[] img = new PImage[largeNum];
  PImage[] imgHighlighted = new PImage[largeNum];
  boolean[] needsInit = new boolean[largeNum];

  FancyButton() {
    for (int i = 0; i < largeNum; i++) {
      needsInit[i] = true;
    }
  }

  void iRect(int i, int x, int y, int w, int h, float r, color normal, color highlighted, String s) {
    iRect(i, x, y, w, h, r, normal, highlighted, s, color(255, 0));
  }
  void iRect(int i, int x, int y, int w, int h, float r, color normal, color highlighted, String s, color outline) {
    if (needsInit[i]) {
      needsInit[i] = false;
      img[i] = init(i, x, y, w, h, r, normal, s);
      imgHighlighted[i] = init(i, x, y, w, h, r, highlighted, s);
    }
    noFill();
    stroke(outline);
    rect(x - 1, y - 1, w + 1, h + 1, r);
    if (mouseIn(x, y, w, h) == false) {
      image(img[i], x, y);
    }
    else {
      image(imgHighlighted[i], x, y);
    }
  }

  PImage init(int i, int x, int y, int w, int h, float r, color thisColor, String s) {
    PImage temp = createImage(w, h, ARGB);
    PGraphics pgraph = createGraphics(w, h, JAVA2D);
    for (int j = y; j <= y+h; j++) {
      stroke(thisColor, map(j, y, y+h, 130, 255));
      line(x, j, x+w, j);
    }
    fill(255);
    if (brightness(thisColor) > 100) {
      fill(0);
    }
    text(s, x + w/2, y + h/2);
    noStroke();
    fill(255, 30);
    ellipse(x + w/2, y - h/2, 2*w, 2*h);
    temp = get(x, y, w, h);
    pgraph.beginDraw();
    pgraph.noStroke();
    pgraph.smooth();
    pgraph.rect(0, 0, w, h, r);
    pgraph.endDraw();
    
    // this is necessary to get the mask to work in JS
    PImage convert = createImage(w, h, ARGB);
    convert = pgraph.get();
    temp.mask(convert);
    
    // normally it would just be
    // temp.mask(pgraph);
    return temp;
  }

  boolean mouseIn(float x, float y, float w, float h) {
    if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) {
      return true;
    }
    else {
      return false;
    }
  }
}



