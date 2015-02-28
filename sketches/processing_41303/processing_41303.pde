
PFont minombre;

void setup() {
  size(500, 200);
  minombre = loadFont("Chalkduster-48.vlw");
  textFont(minombre);
}

void draw() {
  background(209, 245, 119);
  fill(245, 119, 186);
  text("Tatiana Simpson Muñoz", 26, 20, 550, 600);
}

