
boolean dragged = true; //starts out in mouse drag mode

void setup() {
  size(800, 600);
  background(0);
}

void draw() {
  noStroke();
  if (!dragged)
    drawPath();
}

void keyPressed() {
  switch(key) {
    case 'r': background(0);
    case 's': dragged = !dragged;  //switch drawing modes
  }
}

void mouseDragged() {
    if (dragged)
      drawPath();
}

void drawPath() {
  fill(mouseX%255, mouseY%255,(mouseX+mouseY)%255);
  ellipse(mouseX, mouseY, 10, 10);
  ellipse(width-mouseX, mouseY, 10, 10);
  ellipse(pmouseX, pmouseY, 10, 10);
  ellipse(width-pmouseX, pmouseY, 10, 10);
}


