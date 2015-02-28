
void setup() {
  size(700, 700);
  background(255);
  smooth();
  noStroke();
}

void draw() {
  float angle = atan2(mouseY - 350, mouseX - 350);




  pushMatrix();
  translate(350, 350);
  rotate(angle);
  ellipse(0, 0, 600, 50);
  popMatrix();

  if (frameCount % 0.5 == 0) {
    fill(frameCount * 3 % 255, frameCount * 5 % 255, 
    frameCount * 7 % 255);
    // pushMatrix();
    //  translate(300, 300);
    //  rotate(radians(frameCount * 2  % 360));
    //  rect(0, 0, 280, 50);
    //  popMatrix();
  }
}







