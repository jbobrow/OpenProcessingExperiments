

void setup() {
  size(900,900);
  noSmooth();
  fill(10,126,126,10);
  background(0);
}

void draw() {
  if (mousePressed) {
    stroke(144,227,219);
  } else {
    stroke(0);
  }
 ellipse(mouseX+20, mouseY+10, mouseX+40, mouseY+9);
  ellipse(mouseX+76, mouseY+90, mouseX+80, mouseY+30
  ); 
}

