
float space = 40;

void setup() {
  size(400, 400);
  background(0);
  smooth();
}

void draw() {

  for (float y = 20; y < height; y = y + space) {
    println();
    println(y);
    println("+++++");
    for (float x = 20; x < width; x = x + space) {
      noStroke();
      fill(255);
      ellipse(x, y, 10, 10);
      println(x);
    }
  }
}

void mousePressed() {
  saveFrame("thumbnail.png");
}


