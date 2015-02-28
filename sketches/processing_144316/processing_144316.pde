
//2014 Kris Strong
//based on http://funprogramming.org/4-Shades-of-gray-and-colors-frameRate.html

void setup() {
  size(500, 500);
  noLoop();
  noStroke();
}

void draw() {

  fill(random(255), random(255), random(255));
  triangle(0, 0, 0, 250, 250, 0);
  fill(random(255), random(255), random(255));
  triangle(250, 0, 250, 250, 0, 250);

  fill(random(255), random(255), random(255));
  triangle(250, 0, 500, 250, 250, 250);
  fill(random(255), random(255), random(255));
  triangle(250, 0, 500, 0, 500, 250);

  fill(random(255), random(255), random(255));
  triangle(0, 250, 0, 500, 250, 500);
  fill(random(255), random(255), random(255));
  triangle(0, 250, 250, 250, 250, 500);

  fill(random(255), random(255), random(255));
  triangle(250, 250, 500, 250, 250, 500);
  fill(random(255), random(255), random(255));
  triangle(500, 250, 500, 500, 250, 500);
}

void mousePressed() {
  redraw();
}

void keyPressed() {
  if (keyCode == UP) {
    saveFrame("##.png");
  }
}

