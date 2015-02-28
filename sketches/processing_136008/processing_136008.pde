
//Pedro Veneziano, February 24th, Creative Computing B, Benjamin Bacon

/* @pjs preload= "fear.PNG"; */

void setup() {
  size(600,600);
  smooth();
  stroke(255);
  strokeWeight(2);
  rectMode(CENTER);
}

void draw() {
  PImage fear = loadImage("fear.PNG");
  int bw = round(map(mouseX, 0, width, 0, 255));
  fill(bw,20);
  rect(width/2, height/2, width, height);
  noFill();
  image (fear, 0, 0);
  for (int posit = 25; posit < 600; posit += 100) {
  ellipse(mouseX, posit, 50, 50); 
  rect(width - mouseX, posit + 50, 50, 50); }
}


