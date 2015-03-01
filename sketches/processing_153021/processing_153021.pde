
void setup () {
  size(500, 400);
  background(25,55,110);
}
void draw() {
  if (mousePressed) {
    background(22,68,98);
  }
  
  stroke(220,59,65);
  fill(165,165,165);
  ellipse(mouseY, 250, 300, 300);
  
  fill(150, 109, 85);
  ellipse(mouseY, mouseX, 85, 75);
  
  fill(250,250,250);
  rect(mouseX, 75, 80, 80);
}

