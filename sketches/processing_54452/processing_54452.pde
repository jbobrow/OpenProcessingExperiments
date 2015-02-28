
//Problem Set 1.6 by Nathan Smofsky
//A sketch that evokes symmetry

void setup() {
  size(400, 400);
  background(0);
  frameRate(60);
  smooth();
}

void draw() {
  stroke(255);
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  noStroke();
  fill(255, 0, 0);
  ellipse(width/2, height/2, mouseX+20, mouseY+20);
  fill(0, 255, 0);
  ellipse(width/2, height/2, mouseX-40, mouseY-40);
  fill(0);
  ellipse(width/2, height/2, mouseX-140, mouseY-140);
  
  stroke(255);
  line(200, 0, 200, 400);
}

void keyPressed() {
  println(key);
}

