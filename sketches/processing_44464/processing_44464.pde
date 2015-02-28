
PFont font;
int x, y;

void setup() {
  size(400, 400);
  x =width/2;
  y = height/2;
  font = loadFont("Serif-48.vlw");
  textFont(font);
  smooth();
}

void draw() {
  background(0);
  if (keyPressed == true && key == CODED) {
    if (keyCode == UP) {
      y--;
    }
    if (keyCode == DOWN) {
      y++;
    }
  } 
  println(y);
  fill(255);
  ellipse(x, y, width, height);
  fill(0);
  text(key, 100, 100);
}

