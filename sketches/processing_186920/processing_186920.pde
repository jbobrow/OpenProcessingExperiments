
void setup() {
  size(900,900);
}
void draw() {
  fill(32,94,128, 5); // negro transparente
  rect(0, 0, width, height+988); // rectangulo que ocupa toda la ventana
  fill(225);
  if (mousePressed) {fill(169,240,227);if (mousePressed)
  ellipse(mouseX+50, mouseX-50, mouseX+50, mouseY-50);fill(240,134,34,2);
}


    ellipse(mouseX, mouseY+27, 10,10); 
    ellipse(mouseX, mouseY-49, 20,20);
    ellipse(mouseX, mouseY-29, 30,30);
  }

