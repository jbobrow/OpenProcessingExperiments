
//Similar to my other example.
//Move the mouse to move the circles and click to change the color.

void setup() {
  size(800, 800);
  background(0);
  smooth();
}

void draw() {
  
  if(mousePressed) {
    fill(20, 150, 150);
  } else {
    fill (56, 20, 27);
  }
  
  if (keyPressed == true) {
    fill(25);
  }
  
  float x = mouseX;
  float y = mouseY;
  
  ellipse(x + 150, y + 50, 450, 450);
  ellipse(x + 345, y + 450, 210, 210);
  ellipse(x + 70, y + 400, 120, 120);
  fill(255, 90);
  ellipse(x - 50, y, 250, 250);
  fill(255, 90);
  ellipse(x + 260, y + 200, 150, 150);
}


