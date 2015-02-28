
void setup() {
  size(600, 600);
  textFont(createFont("y si nos pones 5?", 25));
}
 
void draw() {
  background(random(740));
 
  translate(width/2, height/2);
  for (int i = 0; i < 5; i++) {
    rotate(TWO_PI / 5.0);
    text("y si nos pones 5?", mouseX-50, mouseY-50);
  }
}
