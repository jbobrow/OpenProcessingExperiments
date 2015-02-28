
float angle;
void setup() {
  size(1400, 400);
  frameRate(30);
}

void draw() {
  noStroke();
  rectMode(CORNER);
  fill(100, 10);
  rect(0, 0, width, height);
  noFill();

  rectMode(CENTER);

  pushMatrix();
  translate(mouseX, mouseY);

  if (mousePressed) {
    stroke(#FFFFFF);
     for (int i = 1; i < 50; i++) {
      rotate(radians(angle/i));
      rect(0, 0, 20/i, 20*i);
    }
  }
  else {
    stroke(#00FF4F);
     for (int i = 1; i < 50; i++) {
      rotate(radians(angle/i));
      rect(0, 0, 20*i, 20*i);
    }
  }
  popMatrix();


  angle+=0.5;
}
