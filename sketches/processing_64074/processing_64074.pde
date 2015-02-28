
PShape nu_logo;

void setup() {
  size (500, 500);
  smooth();
  shapeMode (CENTER);
  nu_logo = loadShape ("nu_logo.svg");
}

void draw() {
  background(0);
  float diameter = map (mouseX, 0, width, 10, 400);
  shape (nu_logo, 250, 250, diameter, diameter);
}

