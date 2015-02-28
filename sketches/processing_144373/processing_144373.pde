
void setup() {
  size(400, 300);

  //smooth(8); anty alyasing
}

void draw() {
  if (mousePressed) {
    fill(30, 34, 90);
    textSize(20);
    text("WTF!!", 100, 100);
  }
  else {
    textSize(1);
  }

  //background(200);
  fill(200, 20);
  rect(0, 0, width, height);

  noCursor();

  //ellipse(x, y, width, height);

  //layer start
  pushMatrix();

  //layer movment
  //translate(x,y)

  translate(mouseX-width/2, mouseY-height/2);

  strokeWeight(3);

  if (mouseX < width/2) {
    fill(255, 250, 250);
  }
  else {
    fill(255, 255, 30);
  }
  //ellipse(width/2, height/2, 200, 200);
  ellipse(width/2, height/2, 200, 200);

  fill(255, 255, 30);
  ellipse(161, 129, 40, 40);
  ellipse(238, 133, 40, 40);
  fill(0, 0, 0);
  ellipse(172, 133, 10, 10);
  fill(0, 0, 0);
  ellipse(228, 133, 10, 10);

  if (mousePressed) {
    ellipse(191, 185, 40, 30);
  }
  else {
    line(142, 191, 262, 191);
  }
  popMatrix();
}


