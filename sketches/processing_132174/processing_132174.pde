
//Sam Legros, Exercise 2, Question 1 

void setup() {
  size(500, 500);
  background(116, 210, 255);
  noStroke();

  //Sun
  fill(253, 255, 139);
  ellipse(0, 0, 200, 200);

  //Land
  fill(141, 229, 156);
  ellipse(250, 850, 1200, 1200);
}

void draw() {
  println("Mouse: " + mouseX + ", " + mouseY);
  frame.setTitle("Mouse: " + mouseX + ", " + mouseY);
}

void mouseClicked() {
  fill(mouseX, 100, mouseY);
  ellipse(mouseX, mouseY, 80, 80);
  fill(mouseX, 0, mouseY); 
  ellipse(mouseX, mouseY, 40, 100);
  ellipse(mouseX, mouseY, 100, 40);
  fill(0, 185, 35);
  rect(mouseX, mouseY, 3, 100);
  fill(250, 255, 0);
  ellipse(mouseX, mouseY, 40, 40);
}



