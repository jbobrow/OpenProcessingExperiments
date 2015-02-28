
boolean drawSquare = false;

void setup () {
  size(400,400);
}

void draw() {
  background(0);
  rectMode(CENTER);
  fill(255);
  if (drawSquare == true) {
    rect(width/2,height/2,100,100);
  }
}

void keyPressed() {
  if (key == 'd' || key == 'D') {
    drawSquare = !drawSquare;
  }
}
