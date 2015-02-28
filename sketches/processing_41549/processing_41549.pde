
void setup() {
  size(400, 400);
  background(255);
  smooth();
}
void draw() {
  // background(200);
  noStroke();
  fill(0, 20);
  rect(0, 0, 400, 400);
  stroke(255);
  if (mousePressed) {
    background(100);
    stroke(255);
    noFill();
    ellipse(mouseX, mouseY, 280, 280);
    strokeWeight(1);
    line(width, height, mouseX+100, mouseY+100);
    line(0, 0, mouseX-100, mouseY-100);
    line(400, 0, mouseX+100, mouseY-100);
    line(0, 400, mouseX-100, mouseY+100);
    strokeWeight(8);
    ellipse(mouseX+100, mouseY+100, 50, 50);
    ellipse(mouseX-100, mouseY-100, 50, 50);
    ellipse(mouseX+100, mouseY-100, 50, 50);
    ellipse(mouseX-100, mouseY+100, 50, 50);
    noFill();
    
    ellipse(mouseX,mouseY,mouseX,mouseY);
  }
fill(255);
  noStroke();
  ellipse(mouseX, mouseY, 10, 10);
  
  }


