
PFont font;
String txt = "RUN FOREST, RUN! faster...";
int y = 0;
int x = 35;
int spd = 1;


void setup() {
  size(400, 230);

  font = loadFont("GiddyupStd-30.vlw");
  textFont(font);
}

void draw() {
  translate(400, 0);
  background(255);

  textSize(30);
  fill(0);
  //text(String, x, y);
  text(txt, y, x);

  y = y - spd;

  if (y < -400 + (-textWidth(txt))) {
    y = 0;
    x = x + 35;
    spd = spd + 7;
    if (/*y < -400 + (-textWidth(txt)) &&*/ x > 230) {
      text(txt, y, x);

      x=35;
      spd=1;
    }
  }
}



