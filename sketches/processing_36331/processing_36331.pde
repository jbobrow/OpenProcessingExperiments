
void setup() {
  size(300, 300);

  smooth();
}

int x=2;

void draw() {
  //this controls Quad1
  noStroke();
  fill(5, 126, 182);
  rect(150, 0, width/2, height/2);

  //this controlsQuad2
  fill(5, 255, 136);
  rect(150, 150, width/2, height/2);

  //this controls Quad3
  noStroke();
  fill(245, 247, 151);
  rect(0, 150, width/2, height/2);

  //this controlsQuad4
  fill(174, 3, 255);
  rect(0, 0, width/2, height/2);

  //this controls the confetti
  if (mouseX<width/2) {
    //leftside
    fill(5, 255, 136);
    ellipse(10, mouseY, 15, 15);
    ellipse(60, mouseY*x, 15, 15);
    ellipse(90, mouseY/2, 15, 15);
    rect(30, mouseY, 5, 15);
    rect(70, mouseY/x, 5, 15);
    rect(120, mouseY*2, 5, 15);
  }
  else {
    fill(5, 126, 182);
    ellipse(10, mouseY, 15, 15);
    ellipse(60, mouseY*x, 15, 15);
    ellipse(90, mouseY/2, 15, 15);
    rect(30, mouseY, 5, 15);
    rect(70, mouseY/x, 5, 15);
    rect(120, mouseY*2, 5, 15);
  }
  if (mouseX>width/2) { //rightside
    fill(245, 247, 151);
    ellipse(290, mouseY, 15, 15);
    ellipse(240, mouseY*x, 15, 15);
    ellipse(210, mouseY/x, 15, 15);
    rect(270, mouseY, 5, 15);
    rect(230, mouseY/x, 5, 15);
    rect(180, mouseY*x, 5, 15);
  }
  else {
    fill(174, 3, 255);
    ellipse(290, mouseY, 15, 15);
    ellipse(240, mouseY*x, 15, 15);
    ellipse(210, mouseY/x, 15, 15);
    rect(270, mouseY, 5, 15);
    rect(230, mouseY/x, 5, 15);
    rect(180, mouseY*x, 5, 15);
  }
  if (mousePressed) {
    //extra confetti=extra fun
    fill(174, 3, 255);
    ellipse(20, mouseX, 15, 15);
    ellipse(60, mouseX*x, 15, 15);
    ellipse(100, mouseX/x, 15, 15);
    rect(140, mouseX, 5, 15);
    rect(180, mouseX/x, 5, 15);
    rect(220, mouseX*x, 5, 15);

    fill(245, 247, 151);
    ellipse(260, mouseX, 15, 15);
    ellipse(390, mouseX*x, 15, 15);
    ellipse(30, mouseX/x, 15, 15);
    rect(70, mouseX, 5, 15);
    rect(110, mouseX/x, 5, 15);
    rect(150, mouseX*x, 5, 15);

    fill(5, 255, 136);
    ellipse(190, mouseX, 15, 15);
    ellipse(230, mouseX*x, 15, 15);
    ellipse(270, mouseX/x, 15, 15);
    rect(10, mouseX, 5, 15);
    rect(50, mouseX/x, 5, 15);
    rect(90, mouseX*x, 5, 15);
  }
}


