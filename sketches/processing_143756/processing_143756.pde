
void setup() {
  size(400, 400);
  colorMode(HSB, 360, width, height);
}

void draw() {
  int size = 200; // Circle's radius
  int padding = 10;
  float angle = map(mouseX, 0, width, 0, TWO_PI);
  float radius = map(mouseY, 0, height, 300, 150);
  
  background(0, 0, height);
  fill(degrees(angle), width, height);
  arc(width/2, height/2, radius, radius, 0, angle);
  String blabla = "The circle is now " + degrees(angle) + " degrees";
  fill(0, width, 0);
  text(blabla, 0, height-padding);
}
