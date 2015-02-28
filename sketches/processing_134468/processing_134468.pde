
// variable declarations up here:

void setup() {
    size(400,400);
    background(100);
  }
  void draw() {
    translate(mouseX, mouseY);
    fill(random(0, 255), random(0, 255), random(0, 255));
    beginShape();
    vertex(0, -50);
    vertex(14, -20);
    vertex(47, -15);
    vertex(23, 7);
    vertex(29, 40);
    vertex(0, 25);
    vertex(-29, 40);
    vertex(-23, 7);
    vertex(-47, -15);
    vertex(-14, -20);
    endShape(CLOSE);
    ellipse(56, 46, 55, 55);
    ellipse(0, -78, 55, 55);
    ellipse(-55, 46, -55, -55);
    }
 


