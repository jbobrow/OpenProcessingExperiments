
void setup() {
  size(1200, 800);
  smooth();
  colorMode(HSB, 360, 100, 100);
}

void draw() {



  background(360, 0, 0);
  stroke(0, 0, 50);

  for (int i =20; i < width; i += 40) { //x
    for (int j =20; j < height; j += 40) { //y
      line(i, 0, i, height);
      line(0, j, width, j);
    }
  }
}
