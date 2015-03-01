
/* @pjs font="Aleo-Regular.ttf"; */

float y = 700.0;
float x = 700.0;
PFont font;
String s = "time";
float opacity = 0.0;
float direction = 1;

void setup() {
  size(500, 500);
//  font = loadFont("Aleo-Regular-48.vlw");
font = createFont("Aleo-Regular",48);
  textFont(font);
}

void draw() {
  frameRate(40);
  opacity += 2 * direction;
  if ((opacity < 0) || (opacity > 255)) {
    direction = -direction;
  }
  background(30, y*.5, x*.5);
  y -= 5;
  x -= 5;
  noStroke();
  fill(x/2, 150, y/.9999999);
  text(s, x, y);
  if (y<0) {
    y = 700;
    x = 700;
  }
}



