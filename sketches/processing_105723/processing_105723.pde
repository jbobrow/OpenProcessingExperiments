
void setup() {
  size(500, 500);
  fill(255);
  background(255);
  frameRate(60);
  smooth();
}

void draw() {

  if (mousePressed == true) {
    strokeWeight(5);
    fill(0);
    line(mouseX, mouseY, mouseX, mouseY);


    println("mouseX: " + mouseX +  "mouseY: " + mouseY);
  }
}
