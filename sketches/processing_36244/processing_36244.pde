
void setup() {
  size(300, 300);
}

void draw() {

  background(mouseX, mouseY, mouseX);//background color will change according to mouse position
  fill(250);//250 will be the normal fill for the rectangles coded below


  if (mousePressed) {//when the mouse is pressed, the background fill and the rectangle fill swap logistics
    background(250);//now the background is a constant 250
    fill(mouseX, mouseY, mouseX);//and the rill of the rectangles changes depending on position of mouse
  }


  rect(25, 25, 50, 25);
  rect(75, 100, 70, 35);
  rect(110, 50, 90, 20);
  rect(170, 85, 15, 15);
  rect(190, 100, 10, 10);
  rect(205, 100, 5, 5);
  rect(210, 110, 5, 5);
  rect(205, 120, 5, 5);
  rect(220, 115, 5, 5);

  rect(25, 250, 50, 25);
  rect(75, 165, 70, 35);
  rect(110, 230, 90, 20);
  rect(170, 200, 15, 15);
  rect(190, 190, 10, 10);
  rect(205, 195, 5, 5);
  rect(210, 185, 5, 5);
  rect(205, 175, 5, 5);
  rect(220, 180, 5, 5);
}


