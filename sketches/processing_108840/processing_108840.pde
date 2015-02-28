
float mapnum = 0;

void setup() {
  size(800, 600);
  smooth();
  colorMode(HSB,360,100,100);
}

void draw() {
  background(mapnum, 100, 100);

  mapnum = map(mouseX, 0, width, 0, 360);
  println(mapnum);

}
