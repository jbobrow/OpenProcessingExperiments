
void setup () {
  size(300, 300);
}


void mouseDragged() {
  background(mouseX-4*mouseY, 0, mouseY-mouseX);
}

void draw() {
  background(72, 165, (mouseX+mouseY)/2);

  fill(mouseX, 30, mouseY);
  arc(140, 150, mouseX, mouseX, PI/2, (3*PI)/2);

  fill(mouseY, 225, mouseX);
  arc(160, 150, mouseY, mouseY, -PI/2, PI/2);


  fill(25, mouseX+mouseY, 100);
  triangle(120, 300, 150, 0, 180, 300);

  fill(255, 0, mouseX);
  triangle(0, 300, 30, 200*mouseY/(1+mouseX), 60, 300);

  fill(25, 125, mouseY);
  triangle(240, 300, 270, 200*mouseX/(1+mouseY), 300, 300);
}


