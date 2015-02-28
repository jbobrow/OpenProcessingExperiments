

  int theta;
void setup() {  //setup function called initially, only once
  size(600, 600);
  
  theta = 0;
}

void draw() {
  background(51);
  translate(mouseX, mouseY);
  fill(102);
  stroke(255);
  strokeWeight(2);
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
  rotate(theta);
  theta++;
}
