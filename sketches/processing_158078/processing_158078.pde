
int perro = 0;
void setup() {
  size(600, 800);
  background(random(250));
 }
void draw() {
  
  stroke(255);
  ellipse(mouseY, mouseX, 50, 50);
  ellipse(mouseX, mouseY, 50, 50);
  ellipse(width-mouseX, mouseY, 10, 10);
  ellipse(mouseX, height-mouseY, 10, 10);
  perro = perro + 50;
  noFill();
}

