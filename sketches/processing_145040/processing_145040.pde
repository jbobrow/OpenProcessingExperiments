
// David Mrugala

void setup() {
  size(600, 600);
  colorMode(RGB);
  //noLoop();
  mouseY=1;
}

void draw() {
  background(255);

  noFill();
  strokeCap(PROJECT);
  strokeWeight(mouseY/10);
  stroke(35, 91, 92);

  float a = mouseY/10;
  
  translate(width/2, height/2);
  for (float i=0; i<360; i+=60) {
    pushMatrix();
    rotate(radians(mouseX));
    rotate(radians(i));
    line(150+a, -150, 150, 150-a);
    popMatrix();
  }
}

