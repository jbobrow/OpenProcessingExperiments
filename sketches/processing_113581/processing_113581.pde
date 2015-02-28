
void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  background(0);
  noStroke();
  rectMode(CENTER);

  fill(255);
  ellipse(width/4, height/2, 100, 100);
  rect(3*width/4, height/2, 100, 100);

  if (mouseX>100 && mouseX<250) {
    fill(255, 0, 0);
    stroke(255);
    strokeWeight(30);
    ellipse(width/4, height/2, 150, 150);
  }
  if (mouseX>400 && mouseX<550) {
    fill(255);
    stroke(0, 255, 0);
    strokeWeight(30);
    rect(3*width/4, height/2, 150, 150);
  }
}




