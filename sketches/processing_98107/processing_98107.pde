
PShape star;

void setup() {
  size(500,500, P2D);
  // First create the shape
  star = createShape();
  star.beginShape();
  // You can set fill and stroke
  star.fill(102);
  star.stroke(255);
  star.strokeWeight(2);

  // Here, we are hardcoding a series of vertices
  star.vertex(0, -50);
  star.vertex(14, -20);
  star.vertex(47, -15);
  star.vertex(23, 7);
  star.vertex(29, 40);
  star.vertex(0, 25);
  star.vertex(-29, 40);
  star.vertex(-23, 7);
  star.vertex(-47, -15);
  star.vertex(-14, -20);
//  star.end();
  star.endShape(CLOSE);
}

void draw() {
  background(51);
  translate(mouseX, mouseY);
  shape(star);
}
