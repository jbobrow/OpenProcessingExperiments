
void setup() {
  size(400, 400);
  background(0);
  smooth();
}

void draw() {

  fill(255, 30);
  noStroke();
  rect(0, 0, width, height);

  stroke(0, 200, 50);
  ellipse(50, 50, mouseX/2-20, mouseX/2-20);
  ellipse(250, 250, mouseX/2, mouseX/2);
  ellipse(150, 150, mouseY/2, mouseY/2);
  ellipse(350, 350, mouseY/2-20, mouseY/2-20);
  stroke(0, 200, 50);
  ellipse(50, 350, mouseX/2-20, mouseX/2-20);
  ellipse(250, 150, mouseX/2-50, mouseX/2-50);
  ellipse(150, 250, mouseY/2-50, mouseY/2-50);
  ellipse(350, 50, mouseY/2-20, mouseY/2-20);
   stroke(200,0,50);
  ellipse (mouseX, mouseY, 100,100);
  ellipse (mouseX, mouseY, mouseX-50, mouseY-70);
  ellipse (mouseX, mouseY, mouseX-100, mouseY-30);
  ellipse (mouseX-150, mouseY+150, 100, 100);
  ellipse (mouseX-150, mouseY+150, mouseX-50, mouseY-70);
  ellipse (mouseX-150, mouseY+150, mouseX-100, mouseY-30);
}


