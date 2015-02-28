
//Jennifer Lau
// For color changes, borrowed from Processing.org tutorial (transform2d)

float angle = 0.0;

void setup() {
  size(800, 800);
  background(255);
  smooth();
 
}

void draw() {
  if (frameCount % 1 == 0) {
    noStroke();
    fill(frameCount * 3 % 255, frameCount * 5 % 255, 
    frameCount * 7 % 255);
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(radians(frameCount * 2  % 360));
    ellipse (32, 32, 30, 30);
    popMatrix();

    if (mousePressed) {
      noFill();
      stroke(frameCount * 3 % 255, frameCount * 5 % 255, 
    frameCount * 7 % 255);
    translate(mouseX, mouseY);
    rotate(radians(frameCount * 2  % 360));
    ellipse (32, 32, 100, 100);
    }

    angle+=0.1; //try commenting this line out,

 
  }
}

  void mouseClicked() {
    background(255);
  }


