
void setup() {

  size(1000, 1000);
}
void draw() {
}


void mouseDragged() {
  ellipse(mouseX+mouseY, mouseX, mouseX, mouseY);

  rect(mouseX, mouseY, mouseY-100, mouseX-100);
}

                
