
void setup() {
  size(300,300);
  fill(255, 40);
  background(0, 50, 100);
}

void draw() {
  if (mousePressed == true) {
    fill(150, 250, 250, 200);
    strokeWeight(2);
    stroke(240, 255, 30);
    ellipse(50, 50, 50, 50);
    
      for (int i = 0; i <6; i++) {
    ellipse(mouseX+40 + i*i, mouseY, TWO_PI, i+40);
  }
  } else {
    fill(255, 26, 200, 90);
    rect(40, 40, 40, 40);
    stroke(255, 200, 40);
  }
  for (int i = 0; i <6; i++) {
    rect(mouseX + i*i*2, mouseY, i+10, i);
  }
}



