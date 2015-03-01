


void setup() {
  size(600, 600);
}

void draw() {

  background(0);
  if (mouseY<=height/2) {
    beginShape();
    fill(255);
    noStroke();
    vertex(60, height/2);
    bezierVertex(mouseX, mouseY, mouseX, mouseY, 540, height/2);
    endShape();


    fill(0);
    ellipse(width/2, height/2-40, 60, 120);
  }
}

