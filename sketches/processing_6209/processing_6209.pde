
void setup(){
  size(600,600);
  background(237,159,176);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
  fill(211,24,24,160);
  ellipse(300,300,300,300);
  ellipseMode(CENTER);
  fill(255);
  ellipse(300,300,300,300);
  ellipseMode(CENTER);
  fill(237,159,176);
  ellipse(300,300,150,150);
  fill(45,160,37);
  strokeWeight(2);
  strokeJoin(MITER);
  rectMode(CENTER);
  rect(300,300,100,100);
  stroke(0);
  noFill();
  rectMode(CENTER);
  rect(300,300,400,400);
  rectMode(CORNERS);
  rect(300,300,100,100);
  rectMode(CORNER);
  rect(300,300,100,100);
  noStroke();
  fill(45,160,37);
  triangle(310,400,400,400,400,310);
  fill(0);
  ellipse(200,200,30,30);
  ellipse(400,400,30,30);
  ellipse(400,200,30,30);
  ellipse(200,400,30,30);
}

void draw() {
  fill(211,24,24,160);
  stroke(0);
  rectMode(CENTER);
  rect(mouseX, mouseY,7,7);
}







