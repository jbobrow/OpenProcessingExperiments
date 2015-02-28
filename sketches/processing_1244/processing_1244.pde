
boolean button = false;
void setup () {
  size(800, 600);
  background(255);
  smooth();
}
void draw() {
  float x = width/2;
  float y = height/2;
  noStroke();
  fill(mouseX-200,mouseY-200,mouseX);
  rectMode(CENTER);
  if (button) {
  rect(x,y,mouseX,mouseY);
  } else {
    ellipse(x,y,mouseX,mouseY);
  }
if (mousePressed) {
  button = !button;
  }
if (keyPressed) {
    background(random(255),random(255),random(255));
  }
}

