

void setup() {
  /*
  Borrowed from website "processing.org"
  */
  size(300, 300);
  background(#001BFF);
}   
void draw() {
  
  if (mousePressed == true) {
    fill(#FFF700);
  } 
  else {
    fill(255);
  }
  translate(mouseX, mouseY);
  stroke(0);
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
}




