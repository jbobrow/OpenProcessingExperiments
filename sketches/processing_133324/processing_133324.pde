
float rectSize = 10;

void setup() {
  size(400,400);
  rectMode(CENTER);
}

void draw() {
  rect(mouseX,mouseY,rectSize,rectSize);
}

void mouseClicked() {
  rectSize = rectSize + 10;  
}

void keyPressed() {
  if (key == '1') {
    fill(255,0,0);
  } else if (key == '2') {
    fill(0,0,255);
  } else if (key == '3') {
    fill(255,255,0);
  }
  rectSize = 10;
}
