
//Bug myBug;

void setup() {
  size(600, 600);
  background(255);
  //myBug = new Bug();
}
 
void draw() {
}

void mousePressed() {
  //myBug.display();
  stroke(0);
  line (mouseX, mouseY,  mouseX + 50, mouseY - 50);
  line (mouseX, mouseY,  mouseX - 50, mouseY - 50);
  line (mouseX, mouseY,  mouseX - 0, mouseY - 50);
  fill(255);
  stroke(0);
  ellipse (mouseX, mouseY, 100, 80);
  fill(0);
  ellipse(mouseX,mouseY, 80, 80);
  fill(255);
  ellipse(mouseX,mouseY, 50, 50);
}
//class Bug{}



