
String myText = "ド";

void setup() {
  size(465, 465);
  background(0);
  frameRate(30);
}

void draw() {
  pushMatrix();
  fill(0, 10);
  rect(0, 0, width, height);
  translate(random(width), random(height));
  rotate(random(-PI/6, -PI/18));
  fill(255, random(51, 204));
  textSize(random(32, 128));
  text(myText, 0, 0);
  popMatrix();
}
