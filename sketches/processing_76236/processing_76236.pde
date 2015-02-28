
int a;
int b;
PImage bg;
PImage JEW;

void setup() {
  bg = loadImage("TheForestMap.jpg");
  JEW = loadImage("YouWin.jpg");
  size(200, 200);
  a = 10;
  b = 180;
}
void draw() {

  background(bg);

  rect(a, b, 10, 10);
  if (key == 'd') {
    a += 10;
    key=' ';
  }
  if (key == 'a') {
    a += -10;
    key=' ';
  }
  if (key == 'w') {
    b += -10;
    key=' ';
  }
  if (key == 's') {
    b += 10;
    key=' ';
  }
  if (a>200) {
    background(JEW);
  }
}


