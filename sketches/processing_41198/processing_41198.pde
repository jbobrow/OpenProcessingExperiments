
PShape bot;

void setup() {
  size(1366, 768);
  smooth();
  bot = loadShape("bot2.svg");
} 

void draw() {
  background(102);
  translate(width/2, height/2);
  float zoom = map(mouseX, 0, width, 0.1, 4.5);
  scale(zoom);
  shape(bot, -140, -140);
}

