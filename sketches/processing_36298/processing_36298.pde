
void setup() {
  size(300, 300);
}

void draw() {
  noStroke();
  
  //composition on the right side background
  fill(15, 127, 160);
  rect(175, 0, width, height);

  //composition on the left side background
  fill(139, 195, 211);
  rect(0, 0, 175, height);

  //top three horizontal lines
  fill(255, 255, 255);
  rect(0, 25, mouseX, 10);
  rect(0, 55, mouseX, 10);
  rect(0, 85, mouseX, 10);

  //once crossing into composition 2
  if (mouseX>150)
    fill(74, 77, 77);
  rect(175, 0, 10, mouseX);
  rect(195, 0, 10, mouseX);

  //composition 1 - yellow form
  fill(228, 240, 70);
  rect(0, 150, mouseX, 50);

  //once crossing into composition 2, yellow turns brown
  if (mouseX>170);
  fill(74, 77, 77);
  rect(175, 150, mouseX, 50);

  //pair of brown lines
  fill(228, 240, 70);
  rect(mouseX, 250, width, 10);
  rect(mouseX, 275, width, 10);

  //once crossing back to composition 1 new forms merge
  if (mouseX < 175);
  fill(15, 127, 160);
  rect(mouseX, 250, width, 10);
  rect(mouseX, 275, width, 10);

  fill(255, 255, 255);
  rect(mouseX, 260, width, 15);

  fill(228, 240, 70);
  rect(mouseX, 200, width, 10);
}


