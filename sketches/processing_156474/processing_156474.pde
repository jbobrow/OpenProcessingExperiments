
 
void setup() {
  size(400, 400);
  frameRate(20);
}
void draw() {
  background(mouseX, 0, mouseY);
  ellipse(width/2, height/2, mouseX, mouseY);
}
      


