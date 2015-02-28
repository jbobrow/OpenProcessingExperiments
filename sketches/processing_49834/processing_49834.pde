
PImage img;

PFont font;

void setup() {
  size(400, 400);
  background(255);

  smooth();

  img = loadImage("hand2.png");
  font = loadFont("font2.vlw");
  textFont(font);

  //noLoop();
}

void draw() {
  noStroke();
  fill(255, 80);
  rect(0, 0, width, height);

  image(img, 0, 130);

  fill(255, 0, 0);
  textSize(18);

  pushMatrix();
  translate(0, 0);
  rotate(radians(10));
  text("We're joined by the red string of fate!", 10, 20);
  popMatrix();

  strokeWeight(5);
  stroke(255, 0, 0);
  noFill();
  arc(143, 180, 35, 10, 0, PI);

  pushMatrix();
  translate(170, 190);
  rotate(radians(45));
  ellipse(0, 0, 30, 10);
  popMatrix();

  pushMatrix();
  translate(170, 170);
  rotate(radians(-45));
  ellipse(0, 0, 30, 10);
  popMatrix();

  bezier(160, 180, mouseX, mouseY, mouseY, mouseX, width, 170);
}


