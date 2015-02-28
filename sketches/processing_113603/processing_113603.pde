
void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  if (mouseX<= 200 && mouseX>= 100 && mouseY <= 300 && mouseY>= 100) {
    fill(255, 0, 0);
    rect(100, 100, 100, 200);
    if (mousePressed == true) {
      fill(0, 255, 0);
      rect(100, 100, 100, 200);
      if (mouseButton == RIGHT) {
        fill(0, 0, 255);
        rect(100, 100, 100, 200);
      }
    }
  }
  else {
    fill(255);
    rect(100, 100, 100, 200);
  }

  if ((mouseX-400)*(mouseX-400)+(mouseY-400)*(mouseY-400) <= 10000) {
    fill(255, 0, 0);
    ellipse(400, 400, 200, 200);
    if (mousePressed == true) {
      fill(0, 255, 0);
      ellipse(400, 400, 200, 200);
      if (mouseButton == RIGHT) {
        fill(0, 0, 255);
        ellipse(400, 400, 200, 200);
      }
    }
  }
  else {
    fill(255);
    ellipse(400, 400, 200, 200);
  }
}



