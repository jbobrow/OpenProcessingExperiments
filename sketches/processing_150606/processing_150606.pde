
void setup() {
  size(200, 180);
}

void draw() {
  background(0);
  fill(#ffffff);
  ellipse(100,100,50,50);
  
 translate(mouseX, mouseY);
  fill(#FF94B8);
  stroke(#FFEBF5);
  strokeWeight(1);
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

}




