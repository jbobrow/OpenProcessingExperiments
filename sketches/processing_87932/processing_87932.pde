
int black = 0;
int light = 245;
int value = 0;

void setup(){
  size(800, 200);
  background(95, 50, 15);
  noCursor();
}

void draw(){
  background(95, 50, 15);
  noStroke();
  
  //columns
  fill(137);
  rect(100, 40, 10, 160);
  rect(300, 40, 10, 160);
  rect(500, 40, 10, 160);
  rect(700, 40, 10, 160);
  
  //black for lights off
  fill(value);
  rect(100, 40, 10, 20);
  rect(300, 40, 10, 20);
  rect(500, 40, 10, 20);
  rect(700, 40, 10, 20);
  
  fill(255, 182, 126);
  ellipse(mouseX, mouseY, 20, 20);
}

void mousePressed() {
  if (value == 0) {
    value = 245;
  } else {
    value = 0;
  }
}

void mouseReleased() {
  if (value == 1) {
    value = 245;
  } else {
    value = 0;
  }
}


