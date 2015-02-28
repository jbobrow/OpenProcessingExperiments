
PImage base1, base2, tabs;
PFont font;

int flg = 1;
float x = 0;
int count;

void setup() {
  size(450, 350);
  smooth();

  base1 = loadImage("base3.png");
  base2 = loadImage("base2.png");
  tabs = loadImage("tabs2.png");

  font = loadFont("font.vlw");
  textFont(font);
  textSize(30);
  textAlign(RIGHT);
}

void draw() {
  if (flg == 1) {
    image(base1, 0, 0);
  }
  else {
    image(base1, 0, 0);

    try {
      Thread.sleep(5);
    }
    catch (InterruptedException e) {
    }

    image(tabs, x, 49);
    x -= 10;
    if (x < -250) {
      x = 0;
      flg = 1;
    }
  }

  fill(0);
  text("Deleted tabs : " + nf(count,4), 440, 340);
}

void mousePressed() {  
  if (mouseX > 230 && mouseX < 245 && mouseY >55 && mouseY < 70) {
    count++;
    flg *= -1;
  }
}

