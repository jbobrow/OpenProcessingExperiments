
PFont font;
float t = 0;

void setup() {
  size(560, 140);
  font = loadFont("futura100.vlw");
  textFont(font, 100);
  textAlign(CENTER, CENTER);
}

void draw() {
  background(15 + 20 * abs(sin(t * 2)));
  t -= 0.01;
  fill(255, 255, 0, 300 * abs(sin(t)) - 100);
  text("STRANGE", width / 2, height / 2);
  fill(0, 255, 130, 275 * abs(sin(t + HALF_PI * 0.5)) - 100);
  text("THINGS", width / 2, height / 2);
  fill(50, 180, 255, 250 * abs(sin(t + HALF_PI)) - 100);
  text("WILL", width / 2, height / 2);  
  fill(255, 17, 93, 225 * abs(sin(t + HALF_PI * 1.5)) - 100);
  text("HAPPEN", width / 2, height / 2);
}

