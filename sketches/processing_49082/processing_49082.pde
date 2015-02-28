
void setup() {
  size(640, 480);
  smooth();
  noCursor();
  frameRate(30);
}

void draw() {
  background(0);
  
  // Casper's head
  noStroke();
  fill(255);
  ellipse(mouseX, mouseY-25, 50, 50);
  
  // Casper's body
  beginShape();
  vertex(mouseX-25, mouseY-25);
  bezierVertex(mouseX-25, mouseY-25, mouseX+25, mouseY-25, mouseX+25, mouseY-25);
  bezierVertex(mouseX+25, mouseY, mouseX+25, mouseY+25, pmouseX+25, pmouseY+50);
  vertex(pmouseX+20, pmouseY+45);
  vertex(pmouseX+15, pmouseY+50);
  vertex(pmouseX+10, pmouseY+45);
  vertex(pmouseX+5, pmouseY+50);
  vertex(pmouseX, pmouseY+45);
  vertex(pmouseX-5, pmouseY+50);
  vertex(pmouseX-10, pmouseY+45);
  vertex(pmouseX-15, pmouseY+50);
  vertex(pmouseX-20, pmouseY+45);
  vertex(pmouseX-25, pmouseY+50);
  bezierVertex(pmouseX-25, pmouseY+25, mouseX-25, mouseY, mouseX-25, mouseY-25);
  endShape();
  
  // Casper's face
  fill(0);
  ellipse(mouseX-9, mouseY-25, 10, 12);
  ellipse(mouseX+9, mouseY-25, 10, 12);
  ellipse(mouseX, mouseY-8, 12, 10);
}

void mousePressed() {
  println("Boo!");
}

