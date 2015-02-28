
void setup() {

  size(500, 500);
}


void draw() {
  background(255, 255, 255);
  
  stroke(0);
  fill(79, 216, 132);
  rect(mouseX-50, mouseY+35, 20, 50);

  stroke(0);
  fill(79, 216, 132);
  rect(mouseX+25, mouseY+35, 20, 50);

  stroke(0);
  fill(79, 216, 132);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, 180, 100);

  stroke(0);
  fill(79, 216, 132);
  ellipseMode(CENTER);
  ellipse(mouseX-100, mouseY-40, 100, 100);

  stroke(0);
  fill(79, 216, 132);
  ellipseMode(CENTER);
  ellipse(mouseX-100, mouseY-40, 90, 90);

  fill(255, 255, 255);
  ellipseMode(CENTER);
  ellipse(mouseX-125, mouseY-60, 20, 20);

  fill(0);
  ellipseMode(CENTER);
  ellipse(mouseX-127, mouseY-55, 9, 9);

  fill(255, 0, 0);
  ellipseMode(CENTER);
  ellipse(mouseX-127, mouseY-55, 10, 10);
}  

