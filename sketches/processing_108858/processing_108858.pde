
float circlecolor = 0;
float backcolor = 0;
float circlesize = 0;

void setup() {
  size(1200, 800);
  smooth();
  colorMode(HSB, 360, 100, 100);
  frameRate(30);
}

void draw() {

  circlecolor = map(mouseX, 0, width, 200, 300);
  backcolor = map(mouseY, 0, width, 000, 200);
  circlesize = map(mouseX, 0, width, 0, 40);

  background(backcolor, 100, 100);
  strokeWeight(5);
  stroke(circlecolor, 100, 100);

  for (int i =20; i < width; i += 40) { //x
    for (int j = 20; j < height; j += 40) { //y
      ellipse(i, j, circlesize, circlesize);
      int(random(0, 2));
      if (int(random(0, 2)) == 0) {
        fill(0);
      }
      else {
        fill(360);
      }
    }
  }
}

