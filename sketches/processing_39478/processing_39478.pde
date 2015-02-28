
int angle = 0;

void setup() {
  size(640, 360);
  background(#790909);
  smooth();
  noStroke();
  fill(0, 102);
}

void draw () {
  // Draw only when mouse is pressed
  if (mousePressed == true) {
    angle += 150;
    float val = cos(radians(angle)) * 6.0;
    for (int a = 0; a < 1000; a += 269) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      fill(0);
      //ellipse(mouseX + xoff, mouseY + yoff, val, val);
      
      ellipse(mouseX, mouseY, 50, 50);
      ellipse(mouseX-30, mouseY-30, 20, 20);
      ellipse(mouseX+25, mouseY-50, 5, 5);
      ellipse(mouseX, mouseY-40, 20, 20);
      ellipse(mouseX+30, mouseY-30, 20, 20);
      ellipse(mouseX-22, mouseY-50, 5, 5);
     
      
      
    }
    fill(#F7F707);
    ellipse(mouseX, mouseY, 2, 2);
  }
}
  


