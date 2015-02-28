
// what to do the when the program first starts up:
void setup() {
  // create a canvas of 400 wide by 400 high pixels:
  size(600, 600);
  smooth(100);
  strokeWeight(10);
}

// what to do when the canvas should be drawn:
void draw() {
  background(5,5,10);
  fill(204, 102, 0);
  stroke(0);
  ellipse(200, 200, 300, 300);
  fill(200);
  ellipse(150, 150, 45, mouseX / 5);
  ellipse(250, 150, 45, mouseY / 10);
  line(200, 200, 200, 230);
  rect(100, 250, 200, mouseX/5);
  point(120, 120);
  point(130, 130);
}
