
void setup() {
  size (400, 400);
  smooth();
  frameRate(30);
}

void draw() {
  background(20, 185, 6);
  
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //Head circle
  fill(255);
  stroke(0);
  ellipse(200, 200, 200, 200);
  
  //eyes circle
  fill(mouseY, 78, mouseX);
  stroke(0);
  ellipse(150, 150, 50, 50);
  ellipse(250, 150, 50, 50);
  
  //eyes pupil
  stroke(0);
  fill(mouseX, mouseY, 345);
  ellipse(150, 150, 25, 25);
  ellipse(250, 150, 25, 25);
  
  stroke(0);
  fill(0);
  arc(200, 225, 100, 100, 0, PI);  // upper half of circle
  
}

