
void setup() {
  size(600,400);
}

void draw() {
  background (49, 124, 180);
  if (mousePressed) {
    fill (111, 350, 38);
  } else {
    fill (#F4F54D);
  }
  ellipse (mouseX, mouseY, 175, 175);  
  fill (0);
  ellipse (270, 90, 20, 40);
  ellipse (330, 90, 20, 40);
  fill (0);
  arc (300, 145, 50, 30, TWO_PI, PI+TWO_PI);
  if (mousePressed) {
    println("I <3 4741");
  }
}
