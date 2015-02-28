
void setup() {
  size(400, 400);
  frameRate(60);
  //noStroke();
}
void draw() {
  noCursor();
  noStroke();
  fill(255, 15);
  rect(0, 0, width, height);
  pushStyle();
  translate(mouseX, mouseY);
  rotate(frameCount);
 // filter(ERODE);
  stroke(#FF5858,255);
  fill(#FF5858,150);
  rect(0, 0, 25, 25, 3, 15, 3, 15);
  popStyle();
}



