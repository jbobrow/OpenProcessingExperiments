
void setup() {
  size(1300, 500); 
  stroke(255);
  background(#000000);
  noFill();
}

void draw() {

stroke((mouseX % 200)+50, (mouseX % 200)+50, (mouseX % 200)+50);
  strokeWeight(3);
line(mouseX,0, mouseX, height);
line(0, mouseY, width, mouseY);

}
