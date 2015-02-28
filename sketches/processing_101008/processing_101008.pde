
void setup() {
  size(1500, 1500); 
  stroke(255);
  background(#FFFFFF);
  noFill();
}

void draw() {

stroke((mouseX % 255), (mouseY % 255), ((mouseX * mouseY) % 255));
  strokeWeight(3);
line(mouseX,0, mouseX, height);
line(0, mouseY, width, mouseY);

}
