
void setup() {
  size(400, 400);
  background(255);
}
void draw() {
  fill( random(200, 255), random(200, 255), random(200, 255) );
  ellipse(mouseX, mouseY, 100, 100);
} 


